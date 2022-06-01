import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class MapLicenceWidget extends StatelessWidget {
  const MapLicenceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyText2Color = Theme.of(context).textTheme.bodyText2?.color;
    final bodyText1Color = Theme.of(context).textTheme.bodyText1?.color;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'donnée carte: © ',
              style: TextStyle(
                color: bodyText2Color,
              ),
            ),
            TextSpan(
              text: 'OpenStreetMap',
              style: TextStyle(
                color: bodyText1Color,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => url.launchUrl(
                      Uri.parse('https://www.openstreetmap.org/copyright'),
                    ),
            ),
            TextSpan(
              text: ' contributors\nstyle carte: ©',
              style: TextStyle(
                color: bodyText2Color,
              ),
            ),
            TextSpan(
              text: ' opentopomap.org',
              style: TextStyle(
                color: bodyText1Color,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => url.launchUrl(
                      Uri.parse('https://opentopomap.org'),
                    ),
            ),
            TextSpan(
              text: ' (CC-BY-SA)',
              style: TextStyle(
                color: bodyText2Color,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => url.launchUrl(
                      Uri.parse(
                        'https://creativecommons.org/licenses/by-sa/3.0/',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
