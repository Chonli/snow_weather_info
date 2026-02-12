import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_pdf.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/provider/favorite_bulletin.dart';

part 'detail_basic_pdf.g.dart';

@riverpod
class _PdfController extends _$PdfController {
  @override
  Future<PdfController?> build(String url) async {
    final client = ref.watch(apiClientProvider);
    final response = await client.get(Uri.parse(url));

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
      _pdfControllerProvider(avalancheBulletin.pdfPath),
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
