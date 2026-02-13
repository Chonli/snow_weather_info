import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfx/pdfx.dart';
import 'package:snow_weather_info/core/widgets/app_pdf.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/provider/favorite_bulletin.dart';

class BulletinPdf extends ConsumerWidget {
  const BulletinPdf({
    required this.pdfController,
    required this.avalancheBulletin,
    super.key,
  });

  final AsyncValue<PdfController?> pdfController;
  final AbstractBulletin avalancheBulletin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
