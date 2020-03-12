import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/ui/avalanche_bulletin_page.dart';

class AvalancheMassifListPage extends StatefulWidget {
  const AvalancheMassifListPage({Key key}) : super(key: key);

  @override
  _AvalancheMassifListPageState createState() =>
      _AvalancheMassifListPageState();
}

class _AvalancheMassifListPageState extends State<AvalancheMassifListPage> {
  List<Mountain> _mountainSelectList = [Mountain.all];

  bool _isVisible(Mountain type) {
    if (_mountainSelectList.contains(Mountain.all)) {
      return true;
    } else if (_mountainSelectList.contains(type)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    final listAlpesNord = repository.getAvalancheBulletin(Mountain.alpes_nord);
    final listAlpesSud = repository.getAvalancheBulletin(Mountain.alpes_sud);
    final listCorse = repository.getAvalancheBulletin(Mountain.corse);
    final listPyrennee = repository.getAvalancheBulletin(Mountain.pyrennee);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulletins Avalanche"),
      ),
      body: Column(
        children: [
          ChipsChoice<Mountain>.multiple(
            isWrapped: true,
            value: _mountainSelectList,
            options: <ChipsChoiceOption<Mountain>>[
              ChipsChoiceOption<Mountain>(value: Mountain.all, label: 'Tous'),
              ChipsChoiceOption<Mountain>(
                  value: Mountain.alpes_nord, label: "Alpes du Nord"),
              ChipsChoiceOption<Mountain>(
                  value: Mountain.alpes_sud, label: "Alpes du Sud"),
              ChipsChoiceOption<Mountain>(
                  value: Mountain.corse, label: "Corse"),
              ChipsChoiceOption<Mountain>(
                  value: Mountain.pyrennee, label: "Pyrennée"),
            ],
            onChanged: (val) => setState(() {
              if ((val.contains(Mountain.all) &&
                      !_mountainSelectList.contains(Mountain.all)) ||
                  val.length == Mountain.values.length - 1) {
                //all is selected
                _mountainSelectList.clear();
                _mountainSelectList.add(Mountain.all);
              } else if (val.length > 1 && val.contains(Mountain.all)) {
                //all is deselected
                val.remove(Mountain.all);
                _mountainSelectList = val;
              } else {
                _mountainSelectList = val;
              }
            }),
          ),
          Expanded(
            child: ListView(
              primary: true,
              children: [
                _cardHeader("Alpes du Nord", Mountain.alpes_nord),
                _listMassif(listAlpesNord, Mountain.alpes_nord),
                _cardHeader("Alpes du Sud", Mountain.alpes_sud),
                _listMassif(listAlpesSud, Mountain.alpes_sud),
                _cardHeader("Corse", Mountain.corse),
                _listMassif(listCorse, Mountain.corse),
                _cardHeader("Pyrénnée", Mountain.pyrennee),
                _listMassif(listPyrennee, Mountain.pyrennee),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardHeader(String title, Mountain type) {
    return Visibility(
      visible: _isVisible(type),
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        color: Colors.blue,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _listMassif(List<AvalancheBulletin> list, type) {
    return Visibility(
      visible: _isVisible(type),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _CardMassif(list[index]);
        },
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
          MaterialPageRoute(
            builder: (context) => AvalancheBulletinPage(avalancheBulletin),
          ),
        ),
      ),
    );
  }
}
