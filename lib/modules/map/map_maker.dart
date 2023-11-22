import 'package:flutter/material.dart';
import 'package:snow_weather_info/extensions/double.dart';

class MapMaker extends StatelessWidget {
  const MapMaker({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
    this.lastSnowHeight,
  });

  final double? lastSnowHeight;
  final Color color;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (lastSnowHeight != null)
          Positioned(
            left: 42,
            bottom: 0,
            child: Text(
              lastSnowHeight!.toStringSnowHeigth,
              style: TextStyle(color: color),
            ),
          ),
        Positioned(
          right: 0,
          bottom: 2,
          child: IconButton(
            icon: icon,
            color: color,
            // ignore: no-empty-block
            onPressed: onPressed ?? () {},
          ),
        ),
      ],
    );
  }
}
