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
  final _mountainSelectList = [Mountain.all];
  final _constMountainList = {
    Mountain.all: 'Tous',
    Mountain.alpesNord: 'Alpes du Nord',
    Mountain.alpesSud: 'Alpes du Sud',
    Mountain.corse: 'Corse',
    Mountain.pyrennee: 'Pyrennée',
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
    for (final mountain in _constMountainList.entries) {
      yield Padding(
        padding: const EdgeInsets.all(4),
        child: ChoiceChip(
          avatar: Visibility(
            visible: _mountainSelectList.contains(mountain.key),
            child: const Icon(Icons.check),
          ),
          label: Text(mountain.value),
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
        title: const Text('Bulletins Avalanche'),
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
                _listMassif('Alpes du Nord', Mountain.alpesNord),
                _listMassif('Alpes du Sud', Mountain.alpesSud),
                _listMassif('Corse', Mountain.corse),
                _listMassif('Pyrénnée', Mountain.pyrennee),
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
          padding: const EdgeInsets.all(12),
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
          physics: const NeverScrollableScrollPhysics(),
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
  const _CardMassif(this.avalancheBulletin);

  final AvalancheBulletin avalancheBulletin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
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
