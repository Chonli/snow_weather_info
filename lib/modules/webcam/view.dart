import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/data/webcams.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/modules/webcam/favorite_notifier.dart';
import 'package:snow_weather_info/router/router.dart';

part 'view.g.dart';

@riverpod
class _Search extends _$Search {
  @override
  String build() {
    return '';
  }

  void search(String value) {
    state = value.toLowerCase();
  }
}

class WebcamListView extends ConsumerWidget {
  const WebcamListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        // recherche
        const _SearchBarView(),
        const _ListFavoriteView(),
        _ListByMassifView(
          mountain: Mountain.alpesNord,
          skiResorts: ConstSkiResorts.webcamsNord,
        ),
        _ListByMassifView(
          mountain: Mountain.alpesSud,
          skiResorts: ConstSkiResorts.webcamsSud,
        ),
        _ListByMassifView(
          mountain: Mountain.corse,
          skiResorts: ConstSkiResorts.webcamsCorse,
        ),
        _ListByMassifView(
          mountain: Mountain.jura,
          skiResorts: ConstSkiResorts.webcamsJura,
        ),
        _ListByMassifView(
          mountain: Mountain.massifCentral,
          skiResorts: ConstSkiResorts.webcamsCentral,
        ),
        _ListByMassifView(
          mountain: Mountain.pyrenees,
          skiResorts: ConstSkiResorts.webcamsPyrenees,
        ),
        _ListByMassifView(
          mountain: Mountain.vosges,
          skiResorts: ConstSkiResorts.webcamsVosges,
        ),
      ],
    );
  }
}

class _ListFavoriteView extends ConsumerWidget {
  const _ListFavoriteView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(
      favoriteSkiResortProvider,
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
          (context, index) => _CardSkiResort(favorites[index]),
          childCount: favorites.length,
        ),
      ),
    );
  }
}

class _ListByMassifView extends ConsumerWidget {
  const _ListByMassifView({
    required this.mountain,
    required this.skiResorts,
  });

  final Mountain mountain;
  final List<SkiResort> skiResorts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(_searchProvider);
    final list = skiResorts
        .where(
          (station) =>
              search.isEmpty ||
              station.name.toLowerCase().contains(
                    search.toLowerCase(),
                  ),
        )
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (list.isEmpty) {
      return const SliverToBoxAdapter();
    }

    return SliverStickyHeader(
      header: AppStickyHeaderView(
        text: mountain.displayName(),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _CardSkiResort(list[index]),
          childCount: list.length,
        ),
      ),
    );
  }
}

class _CardSkiResort extends StatelessWidget {
  const _CardSkiResort(this.resort);

  final SkiResort resort;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(resort.name),
        onTap: () => context.goNamed(
          AppRoute.detailResort.name,
          extra: resort,
        ),
      ),
    );
  }
}

class _SearchBarView extends ConsumerWidget {
  const _SearchBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          onChanged: (value) {
            ref.read(_searchProvider.notifier).search(value);
          },
          decoration: const InputDecoration(
            labelText: 'Recherche',
            hintText: 'Recherche',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
