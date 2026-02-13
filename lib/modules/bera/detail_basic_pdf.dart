import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_pdf.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/provider/favorite_bulletin.dart';

part 'detail_basic_pdf.g.dart';

String _formatDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

@riverpod
class _PdfController extends _$PdfController {
  @override
  Future<PdfController?> build(
    AvalancheBulletinPdf avalancheBulletinPdf,
  ) async {
    late final String url;
    String? urlFallback;
    if (avalancheBulletinPdf.mountain == Mountain.italie) {
      final now = DateTime.now();

      url = avalancheBulletinPdf.pdfPath.replaceAll(
        '<date>',
        _formatDate(now.add(const Duration(days: 1))),
      );
      urlFallback = avalancheBulletinPdf.pdfPath.replaceAll(
        '<date>',
        _formatDate(now),
      );
    } else {
      url = avalancheBulletinPdf.pdfPath;
    }

    final client = ref.watch(apiClientProvider);
    Response response = await client.get(Uri.parse(url));

    if (urlFallback != null && response.statusCode >= 300) {
      response = await client.get(Uri.parse(urlFallback));
    }

    if (response.statusCode >= 300) {
      const error = 'BERA not found';
      state = AsyncError(error, StackTrace.current);
      throw Exception(error);
    }

    final pdfController = PdfController(
      document: PdfDocument.openData(response.bodyBytes),
    );

    ref.onDispose(pdfController.dispose);
    return pdfController;
  }
}

class DetailBasicPdf extends ConsumerWidget {
  const DetailBasicPdf({
    required this.avalancheBulletin,
    super.key,
  });

  final AvalancheBulletinPdf avalancheBulletin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfController = ref.watch(
      _pdfControllerProvider(avalancheBulletin),
    );
    final isFavorite = ref.watch(
      favoriteBulletinProvider.select((fav) => fav.contains(avalancheBulletin)),
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
                .read(favoriteBulletinProvider.notifier)
                .addOrRemoveFavoriteBERA(
                  avalancheBulletin,
                ),
          ),
        ],
      ),
      body: switch (pdfController) {
        AsyncData(:final PdfController value) => AppPdfView(
          value,
        ),
        AsyncError() ||
        AsyncLoading() when pdfController.hasError => const Center(
          child: Text("Erreur: pas de Bulletin d'avalanche trouvé!"),
        ),
        // cas loading sans erreur et pdf controlleur null
        _ => const Center(
          child: CircularProgressIndicator(),
        ),
      },
    );
  }
}
