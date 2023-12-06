import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class MapLicenceWidget extends StatelessWidget {
  const MapLicenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichAttributionWidget(
      attributions: [
        TextSourceAttribution(
          'donnée carte: © OpenStreetMap contributors',
          onTap: () =>
              url.launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
        ),
        TextSourceAttribution(
          'style carte: © opentopomap.org (CC-BY-SA)',
          onTap: () =>
              url.launchUrl(Uri.parse('https://opentopomap.org/credits')),
        ),
      ],
    );
  }
}
