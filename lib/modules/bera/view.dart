import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';

class BERAMassifListView extends StatelessWidget {
  const BERAMassifListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _ListFavoriteView(),
        _ListByMassifView(mountain: Mountain.alpesNord),
        _ListByMassifView(mountain: Mountain.alpesSud),
        _ListByMassifView(mountain: Mountain.corse),
        _ListByMassifView(mountain: Mountain.pyrenees),
      ],
    );
  }
}

class _ListFavoriteView extends StatelessWidget {
  const _ListFavoriteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = context.select<DataNotifier, List<AvalancheBulletin>>(
      (n) => n.favoritesBERA,
    );

    if (favorites.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }

    return SliverStickyHeader(
      header: AppStickyHeaderView(
        text: favorites.length == 1 ? 'Favorite' : 'Favorites',
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _CardMassif(favorites[index]),
          childCount: favorites.length,
        ),
      ),
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
      header: AppStickyHeaderView(
        text: mountain.displayName(),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => _BERAView(
                  avalancheBulletin: avalancheBulletin,
                ),
              ),
            );
          }),
    );
  }
}

class _BERAView extends StatelessWidget {
  const _BERAView({
    Key? key,
    required this.avalancheBulletin,
  }) : super(key: key);

  final AvalancheBulletin avalancheBulletin;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<DataNotifier, bool>(
      (n) => n.favoritesBERA.contains(avalancheBulletin),
    );

    return AppWebPage(
      title: avalancheBulletin.massifName,
      url: avalancheBulletin.url,
      canShare: true,
      isFavorite: isFavorite,
      onFavorite: () {
        context.read<DataNotifier>().addOrRemoveFavoriteBERA(
              avalancheBulletin,
            );
      },
    );
  }
}
