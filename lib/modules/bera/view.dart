import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/provider/favorite_bera.dart';
import 'package:snow_weather_info/router/router.dart';

part 'view.g.dart';

@riverpod
class _MassifFilter extends _$MassifFilter {
  @override
  List<Mountain> build() {
    return [Mountain.all];
  }

  bool isSelected(Mountain mountain) => state.contains(mountain);

  void update(Mountain mountain) {
    final tmpDatas = [...state];

    if (mountain == Mountain.all) {
      state = [Mountain.all];
    } else {
      if (tmpDatas.contains(mountain)) {
        tmpDatas.remove(mountain);
      } else {
        tmpDatas.add(mountain);
      }

      tmpDatas.remove(Mountain.all);

      state = tmpDatas;
    }
  }
}

class BERAMassifListView extends StatelessWidget {
  const BERAMassifListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _MassifFilterView(),
        _ListFavoriteView(),
        _ListByMassifView(mountain: Mountain.alpesNord),
        _ListByMassifView(mountain: Mountain.alpesSud),
        _ListByMassifView(mountain: Mountain.corse),
        _ListByMassifView(mountain: Mountain.pyrenees),
      ],
    );
  }
}

class _MassifFilterView extends ConsumerWidget {
  const _MassifFilterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.read(_massifFilterProvider.notifier);

    return Wrap(
      children: [
        Mountain.all,
        Mountain.alpesNord,
        Mountain.alpesSud,
        Mountain.corse,
        Mountain.pyrenees,
      ]
          .map(
            (mountain) => ChoiceChip(
              label: Text(mountain.displayName),
              selected: filters.isSelected(mountain),
              onSelected: (_) {
                filters.update(mountain);
              },
            ),
          )
          .toList(),
    );
  }
}

class _ListFavoriteView extends ConsumerWidget {
  const _ListFavoriteView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(
      favoriteBeraProvider,
    );

    if (favorites.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }

    return SliverStickyHeader(
      header: AppStickyHeaderView(
        text: favorites.length == 1 ? 'Favori' : 'Favoris',
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

class _ListByMassifView extends ConsumerWidget {
  const _ListByMassifView({
    required this.mountain,
  });

  final Mountain mountain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ConstantDatalist.listAvalancheBulletin
        .where(
          (b) => b.mountain == mountain,
        )
        .toList()
      ..sort((a, b) => a.massifName.compareTo(b.massifName));

    return SliverStickyHeader(
      header: AppStickyHeaderView(
        text: mountain.displayName,
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
        onTap: () => context.goNamed(
          AppRoute.detailBera.name,
          extra: avalancheBulletin,
        ),
      ),
    );
  }
}
