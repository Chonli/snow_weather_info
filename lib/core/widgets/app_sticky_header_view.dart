import 'package:flutter/material.dart';

class AppStickyHeaderView extends StatelessWidget {
  const AppStickyHeaderView({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 25,
        ),
      ),
    );
  }
}
