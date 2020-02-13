import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapLicenceWidget extends StatelessWidget {
  const MapLicenceWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'donnée carte: © ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'OpenStreetMap',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch('https://www.openstreetmap.org/copyright');
                  },
              ),
              TextSpan(
                text: ' contributors\nstyle carte: ©',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: ' opentopomap.org',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://opentopomap.org');
                  },
              ),
              TextSpan(
                text: ' (CC-BY-SA)',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://creativecommons.org/licenses/by-sa/3.0/');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
