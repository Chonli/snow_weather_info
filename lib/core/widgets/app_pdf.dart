import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class AppPdfView extends StatelessWidget {
  const AppPdfView(this.controller);

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
