import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';

class NivosePage extends StatelessWidget {
  final Nivose nivose;
  const NivosePage(this.nivose);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(nivose.name),
      ),
      body: Center(
        child: FutureBuilder(
            future: repository.updateUrlNivo(nivose.codeMF),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text('Erreur de chargement');
                  } else {
                    return CachedNetworkImage(
                      imageUrl: snapshot.data,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      cacheManager: DefaultCacheManager(),
                    );
                  }
              }
            }),
      ),
    );
  }
}
