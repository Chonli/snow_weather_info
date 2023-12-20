import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/provider/favorite_station.dart';

part 'nivose_page.g.dart';

@riverpod
bool _isFavorite(Ref ref, String codeMF) {
  final stations = ref.watch(favoriteStationProvider);

  return stations.any(
    (element) => switch (element) {
      final Nivose nivose => nivose.codeMF == codeMF,
      _ => false,
    },
  );
}

class NivosePage extends ConsumerStatefulWidget {
  const NivosePage({
    required this.nivose,
    super.key,
  });
  final Nivose nivose;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NivosePageState();
}

class _NivosePageState extends ConsumerState<NivosePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(currentMapLocProvider.notifier).setLocation(
              widget.nivose.position,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(
      _isFavoriteProvider(widget.nivose.codeMF),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nivose.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => setState(
              () => ref
                  .read(favoriteStationProvider.notifier)
                  .addOrRemoveFavoriteStation(widget.nivose),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => Share.share(
              'Nivose ${widget.nivose.name}\ndonnée semaine: ${widget.nivose.urlWeek}\ndonnée saison: ${widget.nivose.urlSeason}\n',
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              if (widget.nivose.urlWeek.isNotEmpty)
                _NetworkImage(
                  url: widget.nivose.urlWeek,
                ),
              const SizedBox(height: 5),
              if (widget.nivose.urlSeason.isNotEmpty)
                _NetworkImage(
                  url: widget.nivose.urlSeason,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
