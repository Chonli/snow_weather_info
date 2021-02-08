import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/ui/avalanche_bulletin_page.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AvalancheMassifListPage extends StatefulWidget {
  const AvalancheMassifListPage({Key key}) : super(key: key);

  @override
  _AvalancheMassifListPageState createState() =>
      _AvalancheMassifListPageState();
}

class _AvalancheMassifListPageState extends State<AvalancheMassifListPage> {
  List<Mountain> _mountainSelectList = [Mountain.all];
  final Map<Mountain, String> _constMountainList = {
    Mountain.all: "Tous",
    Mountain.alpes_nord: "Alpes du Nord",
    Mountain.alpes_sud: "Alpes du Sud",
    Mountain.corse: "Corse",
    Mountain.pyrennee: "Pyrennée",
  };

  bool _isVisible(Mountain type) {
    if (_mountainSelectList.contains(Mountain.all)) {
      return true;
    } else if (_mountainSelectList.contains(type)) {
      return true;
    } else {
      return false;
    }
  }

  Iterable<Widget> get mountainWidgets sync* {
    for (var mountain in _constMountainList.entries) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          avatar: Visibility(
            visible: _mountainSelectList.contains(mountain.key),
            child: Icon(Icons.check),
          ),
          label: Text("${mountain.value}"),
          selected: _mountainSelectList.contains(mountain.key),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                if (mountain.key == Mountain.all ||
                    _mountainSelectList.length == 3) {
                  _mountainSelectList.clear();
                  _mountainSelectList.add(Mountain.all);
                } else {
                  _mountainSelectList.add(mountain.key);
                }
                if (_mountainSelectList.length > 1 &&
                    _mountainSelectList.contains(Mountain.all)) {
                  _mountainSelectList.remove(Mountain.all);
                }
              } else {
                _mountainSelectList.remove(mountain.key);
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulletins Avalanche"),
      ),
      body: Column(
        children: [
          Wrap(
            children: mountainWidgets.toList(),
          ),
          Expanded(
            child: ListView(
              primary: true,
              children: [
                _listMassif("Alpes du Nord", Mountain.alpes_nord),
                _listMassif("Alpes du Sud", Mountain.alpes_sud),
                _listMassif("Corse", Mountain.corse),
                _listMassif("Pyrénnée", Mountain.pyrennee),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMassif(String title, Mountain type) {
    final repository = context.watch<DataNotifier>();
    final list = repository.getAvalancheBulletin(type);

    return Visibility(
      visible: _isVisible(type),
      child: StickyHeader(
        header: Container(
          padding: EdgeInsets.all(12.0),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline6.color,
                fontSize: 25),
          ),
        ),
        content: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _CardMassif(list[index]);
          },
        ),
      ),
    );
  }
}

class _CardMassif extends StatelessWidget {
  final AvalancheBulletin avalancheBulletin;
  _CardMassif(this.avalancheBulletin);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      child: ListTile(
        title: Text(avalancheBulletin.massifName),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (context) => AvalancheBulletinPage(avalancheBulletin),
          ),
        ),
      ),
    );
  }
}
