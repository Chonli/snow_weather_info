import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/provider/station_data.dart';
import 'package:snow_weather_info/router/router.dart';

class SplashSreenPage extends ConsumerWidget {
  const SplashSreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      stationDataProvider.select((n) => n.isLoading),
      (previous, next) {
        if (next == false) {
          context.goNamed(AppRoute.stations.name);
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/icon.png',
              fit: BoxFit.contain,
              height: 128,
              width: 128,
            ),
            const Padding(padding: EdgeInsets.all(20)),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
