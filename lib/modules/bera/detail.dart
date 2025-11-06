import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/provider/favorite_bera.dart';

part 'detail.g.dart';

@Riverpod(keepAlive: true)
class _BeraTokenHeader extends _$BeraTokenHeader {
  @override
  Map<String, String> build() {
    return {};
  }

  FutureOr<void> updateHeader({bool forceReset = false}) async {
    if (forceReset) {
      state = {};
    }

    if (state.isEmpty) {
      final headlessWebView = HeadlessInAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            'https://meteofrance.com/meteo-montagne/alpes-du-nord/risques-avalanche',
          ),
        ),
        initialSettings: InAppWebViewSettings(
          isInspectable: kDebugMode,
          useShouldInterceptRequest: true,
        ),
        shouldInterceptRequest: (controller, request) async {
          final header = request.headers ?? <String, String>{};
          if (state.isEmpty &&
              request.url.rawValue.contains(
                'https://rwg.meteofrance.com',
              ) &&
              header['Authorization'] != null) {
            state = header;
          }
          return;
        },
      );

      ref.onDispose(headlessWebView.dispose);

      await headlessWebView.run();
    }
  }
}

@riverpod
class _PdfController extends _$PdfController {
  @override
  Future<PdfController?> build(int beraNumber) async {
    final headers = ref.watch(_beraTokenHeaderProvider);
    if (headers.isEmpty) {
      await ref.read(_beraTokenHeaderProvider.notifier).updateHeader();

      return null;
    }

    final response = await http.get(
      Uri.parse(
        'https://rpcache-aa.meteofrance.com/gdss/v1/metronome_bra/blob?sort-results-by=-blob_creation_time&blob_filename=BRA_$beraNumber.pdf',
      ),
      headers: headers,
    );

    if (response.statusCode == 404) {
      const error = 'BERA not found';
      state = AsyncError(error, StackTrace.current);
      throw Exception(error);
    }

    if (response.statusCode != 200) {
      await ref
          .read(_beraTokenHeaderProvider.notifier)
          .updateHeader(forceReset: true);
      return null;
    }

    final pdfController = PdfController(
      document: PdfDocument.openData(response.bodyBytes),
    );

    ref.onDispose(pdfController.dispose);

    return pdfController;
  }
}

class BERADetailPage extends ConsumerWidget {
  const BERADetailPage({
    required this.avalancheBulletin,
    super.key,
  });

  final AvalancheBulletin avalancheBulletin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfController = ref.watch(
      _pdfControllerProvider(avalancheBulletin.beraNumber),
    );
    final isFavorite = ref.watch(
      favoriteBeraProvider.select((fav) => fav.contains(avalancheBulletin)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(avalancheBulletin.massifName),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () => ref
                .read(favoriteBeraProvider.notifier)
                .addOrRemoveFavoriteBERA(
                  avalancheBulletin,
                ),
          ),
        ],
      ),
      body: switch (pdfController) {
        AsyncData(:final PdfController value) => _PdfView(
          value,
        ),
        AsyncError() ||
        AsyncLoading() when pdfController.hasError => const Center(
          child: Text('Erreur: pas de BERA trouvé'),
        ),
        // cas loading sans erreur et pdf controlleur null
        _ => const Center(
          child: CircularProgressIndicator(),
        ),
      },
    );
  }
}

class _PdfView extends StatelessWidget {
  const _PdfView(this.controller);

  final PdfController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PdfView(controller: controller),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () {
                controller.previousPage(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
            PdfPageNumber(
              controller: controller,
              builder: (_, loadingState, page, pagesCount) => Text(
                'Pages $page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                controller.nextPage(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
