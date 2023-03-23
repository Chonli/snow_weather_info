import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/station.dart';

class NivosePage extends ConsumerStatefulWidget {
  const NivosePage({
    super.key,
    required this.nivose,
  });
  final Nivose nivose;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NivosePageState();
}

class _NivosePageState extends ConsumerState<NivosePage> {
  @override
  void initState() {
    super.initState();
    ref.read(dataNotifier).currentMapLoc = widget.nivose.position;
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(
      dataNotifier.select(
        (n) => n.isFavorite(widget.nivose),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nivose.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => setState(
              () => ref
                  .read(dataNotifier)
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
