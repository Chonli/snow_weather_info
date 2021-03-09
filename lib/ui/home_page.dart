import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/ui/avalanche_list_widget.dart';
import 'package:snow_weather_info/ui/avalanche_massif_list_page.dart';
import 'package:snow_weather_info/ui/list_station_widget.dart';
import 'package:snow_weather_info/ui/map_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    final notifier = context.read<DataNotifier>();
    _tabController = TabController(
        vsync: this, length: 3, initialIndex: notifier.currentIndexTab);
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
                  Navigator.of(context).push(
                    MaterialPageRoute<Widget>(
                      builder: (BuildContext context) =>
                          const AvalancheMassifListPage(),
                    ),
                  );
                  break;
                case 1:
                  _openAboutDialog(context);
                  break;
                case 2:
                  _openBREAPage(context);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
              // TODO Fixme Adresse BREA plus valide
              // PopupMenuItem(
              //   value: 0,
              //   child: ListTile(
              //     leading: Icon(Icons.ac_unit),
              //     title: Text('Bulletin Avalanche'),
              //   ),
              // ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('Lien BREA'),
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
          tabs: const [
            Tab(text: 'Stations', icon: Icon(Icons.list)),
            Tab(text: 'Carte', icon: Icon(Icons.map)),
            Tab(text: 'Avalanches', icon: Icon(Icons.rss_feed)),
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
        ],
      ),
    );
  }

  void _openBREAPage(BuildContext context) {
    url.launch('https://meteofrance.com/meteo-montagne');
  }

  void _openAboutDialog(BuildContext context) {
    final packageInfo = context.read<DataNotifier>().packageInfo;
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
              style:
                  TextStyle(color: Theme.of(context).textTheme.bodyText2.color),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            InkWell(
              onTap: () =>
                  url.launch('https://github.com/Chonli/snow_weather_info'),
              child: Text(
                'Lien vers le projet',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
          ],
        );
      },
    );
  }
}
