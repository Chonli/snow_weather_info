import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/avalanche_massif_list_page.dart';
import 'package:snow_weather_info/ui/list_station_widget.dart';
import 'package:snow_weather_info/ui/map_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Repository repository;
  const HomePage({Key key, this.title, this.repository}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Repository get repository => widget.repository;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: 2, initialIndex: repository.currentIndexTab);
    _tabController.addListener(() {
      repository.currentIndexTab = _tabController.index;
    });
    print("init");
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
              PopupMenuItem(
                value: 0,
                child: ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('Bulletin Avalanche'),
                ),
              ),
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
          ListStationWidget(repository),
          MapWidget(repository),
        ],
      ),
    );
  }

  void _openAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text("A propos..."),
          content: Container(
            margin: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Version: ${repository.packageInfo.version}+${repository.packageInfo.buildNumber}\n\n',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Lien vers le projet',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launch(
                            'https://github.com/Chonli/snow_weather_info');
                      },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
