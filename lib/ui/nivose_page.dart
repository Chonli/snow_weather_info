import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';

class NivosePage extends StatelessWidget {
  final Nivose nivose;
  const NivosePage(this.nivose);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    repository.currentMapLoc = nivose.position;
    return Scaffold(
      appBar: AppBar(
        title: Text(nivose.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Share.share(
                  "Nivose ${nivose.name}\ndonnée semaine: ${nivose.urlWeek}\ndonnée saison: ${nivose.urlSeason}\n"))
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: repository.updateUrlNivo(nivose.codeMF),
            builder: (BuildContext context, AsyncSnapshot<Nivose> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text('Erreur de chargement');
                  } else {
                    final nivo = snapshot.data;
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          CachedNetworkImage(
                            imageUrl: nivo.urlWeek != null ? nivo.urlWeek : "",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            cacheManager: DefaultCacheManager(),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          CachedNetworkImage(
                            imageUrl:
                                nivo.urlSeason != null ? nivo.urlSeason : "",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            cacheManager: DefaultCacheManager(),
                          ),
                        ],
                      ),
                    );
                  }
              }
            }),
      ),
    );
  }
}
