import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/modules/avalanche/view.dart';
import 'package:snow_weather_info/modules/bera/view.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/modules/station/list_station_widget.dart';
import 'package:snow_weather_info/ui/preference_page.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final notifier = context.read<DataNotifier>();
    _tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: notifier.currentIndexTab,
    );
    _tabController.addListener(() {
      notifier.currentIndexTab = _tabController.index;
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
                color: Theme.of(context).textTheme.bodyText2?.color,
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
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
