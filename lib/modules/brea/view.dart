import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';

class BREAMassifListView extends StatelessWidget {
  const BREAMassifListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _ListByMassifView(mountain: Mountain.alpesNord),
        _ListByMassifView(mountain: Mountain.alpesSud),
        _ListByMassifView(mountain: Mountain.corse),
        _ListByMassifView(mountain: Mountain.pyrenees),
      ],
    );
  }
}

class _ListByMassifView extends StatelessWidget {
  const _ListByMassifView({
    Key? key,
    required this.mountain,
  }) : super(key: key);

  final Mountain mountain;

  @override
  Widget build(BuildContext context) {
    final list = context.select<DataNotifier, List<AvalancheBulletin>>(
      (n) => n.avalancheBulletins.where((b) => b.mountain == mountain).toList(),
    );
    list.sort((a, b) => a.massifName.compareTo(b.massifName));

    return SliverStickyHeader(
      header: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).primaryColor,
        child: Text(
          mountain.displayName(),
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6?.color,
            fontSize: 25,
          ),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _CardMassif(list[index]),
          childCount: list.length,
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
            builder: (context) => AppWebPage(
              title: avalancheBulletin.massifName,
              url: avalancheBulletin.url,
              canShare: true,
            ),
          ),
        ),
      ),
    );
  }
}
