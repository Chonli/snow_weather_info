import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/ui/avalanche_massif_list_page.dart';
import 'package:snow_weather_info/ui/list_station_widget.dart';
import 'package:snow_weather_info/ui/map_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
        vsync: this, length: 2, initialIndex: notifier.currentIndexTab);
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
            offset: Offset(0, 40),
            onSelected: (int value) async {
              switch (value) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AvalancheMassifListPage()));
                  break;
                case 1:
                  _openAboutDialog(context);
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
              PopupMenuItem(
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
          key: PageStorageKey("tab_key"),
          controller: _tabController,
          tabs: [
            Tab(text: "Liste", icon: Icon(Icons.list)),
            Tab(text: "Carte", icon: Icon(Icons.map)),
          ],
        ),
      ),
      body: TabBarView(
        key: PageStorageKey("tab_key"),
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListStationWidget(),
          MapWidget(),
        ],
      ),
    );
  }

  void _openAboutDialog(BuildContext context) {
    final packageInfo = context.read<DataNotifier>().packageInfo;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationName: "Info Neige",
          applicationVersion:
              "version: ${packageInfo.version}+${packageInfo.buildNumber}",
          applicationIcon: Image.asset(
            "assets/icon/icon.png",
            width: 42,
            height: 42,
          ),
          applicationLegalese: "MIT",
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5)),
            Text(
              'Développeur: Chonli',
              style: TextStyle(color: Theme.of(context).textTheme.body1.color),
            ),
            Padding(padding: EdgeInsets.all(5)),
            InkWell(
              child: new Text(
                'Lien vers le projet',
                style:
                    TextStyle(color: Theme.of(context).textTheme.body2.color),
              ),
              onTap: () async =>
                  await launch('https://github.com/Chonli/snow_weather_info'),
            ),
          ],
        );
      },
    );
  }
}
