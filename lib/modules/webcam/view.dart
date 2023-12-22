import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/data/webcams.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
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
    return const CustomScrollView(
      slivers: [
        // recherche
        _SearchBarView(),
        _ListFavoriteView(),
        _ListByMassifView(mountain: Mountain.alpesNord),
        _ListByMassifView(mountain: Mountain.alpesSud),
        //_ListByMassifView(mountain: Mountain.corse),
        _ListByMassifView(mountain: Mountain.jura),
        _ListByMassifView(mountain: Mountain.massifCentral),
        _ListByMassifView(mountain: Mountain.pyrenees),
      ],
    );
  }
}

class _ListFavoriteView extends ConsumerWidget {
  const _ListFavoriteView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(chonli): Add favorites ski resort
    // final favorites = ref.watch(
    //   favoriteBeraProvider,
    // );

    // if (favorites.isEmpty) {
    return const SliverToBoxAdapter(
      child: SizedBox.shrink(),
    );
    // }

    // return SliverStickyHeader(
    //   header: AppStickyHeaderView(
    //     text: favorites.length == 1 ? 'Favorite' : 'Favorites',
    //   ),
    //   sliver: SliverList(
    //     delegate: SliverChildBuilderDelegate(
    //       (context, index) => _CardMassif(favorites[index]),
    //       childCount: favorites.length,
    //     ),
    //   ),
    // );
  }
}

class _ListByMassifView extends ConsumerWidget {
  const _ListByMassifView({
    required this.mountain,
  });

  final Mountain mountain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(_searchProvider);
    final list = ConstSkiResorts.webcamsByResort
        .where(
          (b) => b.mountain == mountain,
        )
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
          (context, index) => _CardMassif(list[index]),
          childCount: list.length,
        ),
      ),
    );
  }
}

class _CardMassif extends StatelessWidget {
  const _CardMassif(this.resort);

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
