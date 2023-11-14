import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/modules/avalanche/view.dart';
import 'package:snow_weather_info/modules/bera/view.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/modules/settings/preference_page.dart';
import 'package:snow_weather_info/modules/station/list_station_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url;

part 'home_page.g.dart';

@Riverpod(keepAlive: false)
class _CurrentTabIndex extends _$CurrentTabIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final index = ref.read(_currentTabIndexProvider);
    _tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: index,
    );
    _tabController.addListener(() {
      ref.read(_currentTabIndexProvider.notifier).setIndex(
            _tabController.index,
          );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<int>(
            offset: const Offset(0, 40),
            onSelected: (int value) async {
              switch (value) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => const PreferencePage(),
                    ),
                  );
                  break;
                case 1:
                  _openAboutDialog(context);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
              const PopupMenuItem(
                value: 0,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Préférences...'),
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('A propos...'),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          key: const PageStorageKey('tab_key'),
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const [
            Tab(text: 'Stations', icon: Icon(Icons.list)),
            Tab(text: 'Carte', icon: Icon(Icons.map)),
            Tab(text: 'Avalanches', icon: Icon(Icons.rss_feed)),
            Tab(text: 'BERA', icon: Icon(Icons.ac_unit)),
          ],
        ),
      ),
      body: TabBarView(
        key: const PageStorageKey('tab_key'),
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ListStationWidget(),
          MapWidget(),
          AvalancheListWidget(),
          BERAMassifListView(),
        ],
      ),
    );
  }

  Future<void> _openAboutDialog(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    showDialog<AboutDialog>(
      context: context,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationName: 'Info Neige',
          applicationVersion:
              'version: ${packageInfo.version}+${packageInfo.buildNumber}',
          applicationIcon: Image.asset(
            'assets/icon/icon.png',
            width: 42,
            height: 42,
          ),
          applicationLegalese: 'MIT',
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              'Développeur: Chonli',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            InkWell(
              onTap: () => url.launchUrl(
                Uri.parse('https://github.com/Chonli/snow_weather_info'),
              ),
              child: Text(
                'Lien vers le projet',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}