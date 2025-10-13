import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/extensions/atom_item.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/avalanche/view.dart';
import 'package:snow_weather_info/modules/bera/detail.dart';
import 'package:snow_weather_info/modules/bera/view.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/modules/home/home_page.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/modules/nivose/nivose_page.dart';
import 'package:snow_weather_info/modules/settings/preference_page.dart';
import 'package:snow_weather_info/modules/splashscreen/view.dart';
import 'package:snow_weather_info/modules/station/list_station_widget.dart';
import 'package:snow_weather_info/modules/webcam/view.dart';
import 'package:snow_weather_info/modules/webcam/webcams_resort.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _stationsNavigatorKey = GlobalKey<NavigatorState>();
final _mapNavigatorKey = GlobalKey<NavigatorState>();
final _avalanchesNavigatorKey = GlobalKey<NavigatorState>();
final _beraNavigatorKey = GlobalKey<NavigatorState>();
final _webcamNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: AppRoute.root.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        builder: (context, state) => const SplashSreenPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.setting.path,
        name: AppRoute.setting.name,
        builder: (context, state) => const PreferencePage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) =>
            HomePage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _stationsNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.stations.path,
                name: AppRoute.stations.name,
                builder: (context, state) => const ListStationWidget(),
                routes: [
                  GoRoute(
                    path: AppRoute.detailSt.path,
                    name: AppRoute.detailSt.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final station = state.extra;

                      return station is Station
                          ? DataStationView(station: station)
                          : NivosePage(nivose: station! as Nivose);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _mapNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.map.path,
                name: AppRoute.map.name,
                builder: (context, state) => const MapWidget(),
                routes: [
                  GoRoute(
                    path: AppRoute.detailMapSt.path,
                    name: AppRoute.detailMapSt.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final station = state.extra;

                      return station is Station
                          ? DataStationView(station: station)
                          : NivosePage(nivose: station! as Nivose);
                    },
                  ),
                  GoRoute(
                    path: AppRoute.detailMapAv.path,
                    name: AppRoute.detailMapAv.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final item = state.extra! as AtomItem;

                      return AppWebPage(
                        title: item.shortTitle,
                        url: item.url,
                        canIsOpen: true,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _avalanchesNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.avalanches.path,
                name: AppRoute.avalanches.name,
                builder: (context, state) => const AvalancheListWidget(),
                routes: [
                  GoRoute(
                    path: AppRoute.detailAv.path,
                    name: AppRoute.detailAv.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final item = state.extra! as AtomItem;

                      return AppWebPage(
                        title: item.shortTitle,
                        url: item.url,
                        canIsOpen: true,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _beraNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.bera.path,
                name: AppRoute.bera.name,
                builder: (context, state) => const BERAMassifListView(),
                routes: [
                  GoRoute(
                    path: AppRoute.detailBera.path,
                    name: AppRoute.detailBera.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final bulletin = state.extra! as AvalancheBulletin;

                      return BERADetailPage(
                        avalancheBulletin: bulletin,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _webcamNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.webcam.path,
                name: AppRoute.webcam.name,
                builder: (context, state) => const WebcamListView(),
                routes: [
                  GoRoute(
                    path: AppRoute.detailResort.path,
                    name: AppRoute.detailResort.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final resort = state.extra! as SkiResort;

                      return WebcamsForResortView(
                        resort: resort,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}

enum AppRoute {
  root._('/', 'root'),
  setting._('/setting', 'setting'),
  stations._('$_home/stations', 'stations'),
  map._('$_home/map', 'map'),
  avalanches._('$_home/avalanches', 'avalanches'),
  bera._('$_home/bera', 'bera'),
  webcam._('$_home/webcam', 'webcam'),
  detailSt._('detail_station', 'detail_station'),
  detailMapSt._('detail_station', 'detail_map_station'),
  detailAv._('detail_avalanche', 'detail_avalanche'),
  detailMapAv._('detail_avalanche', 'detail_map_avalanche'),
  detailResort._('detail_resort', 'detail_resort'),
  detailBera._('detail_bera', 'detail_bera');

  const AppRoute._(this.path, this.name);
  final String path;
  final String name;

  //Home routes
  static const _home = '/home';
}
