import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/modules/bera/bulletin_pdf.dart';

part 'detail_bulletin_ad.g.dart';

@riverpod
class _PdfController extends _$PdfController {
  @override
  Future<PdfController?> build(
    AvalancheBulletinAndorre avalancheBulletin,
  ) async {
    final client = ref.watch(apiClientProvider);
    final responsehttp = await client.get(Uri.parse(avalancheBulletin.url));

    if (responsehttp.statusCode >= 300) {
      const error = 'BERA not found';
      state = AsyncError(error, StackTrace.current);
      throw Exception(error);
    }

    final regex = RegExp(
      r'<a href="(https:\/\/www\.meteo\.ad\/uploads\/neu\/estatNeu\d+fr\.pdf)"[^>]*title="Version pour imprimer"[^>]*>',
    );
    final match = regex.firstMatch(responsehttp.body);
    final url = match?.group(1);

    if (url == null) {
      const error = 'BERA not found';
      state = AsyncError(error, StackTrace.current);
      throw Exception(error);
    }

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

class DetailAndrorre extends ConsumerWidget {
  const DetailAndrorre({
    required this.avalancheBulletin,
    super.key,
  });

  final AvalancheBulletinAndorre avalancheBulletin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfController = ref.watch(
      _pdfControllerProvider(avalancheBulletin),
    );

    return BulletinPdf(
      pdfController: pdfController,
      avalancheBulletin: avalancheBulletin,
    );
  }
}
