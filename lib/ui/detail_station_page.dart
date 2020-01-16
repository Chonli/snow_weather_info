import 'package:flutter/material.dart';

class DetailStationPage extends StatelessWidget {
  final String _id;

  DetailStationPage(this._id);

  @override
  Widget build(BuildContext context) {
    return Text(_id);
  }
}
