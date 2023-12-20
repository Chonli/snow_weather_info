import 'package:flutter/material.dart';

class AppStickyHeaderView extends StatelessWidget {
  const AppStickyHeaderView({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 25,
        ),
      ),
    );
  }
}
