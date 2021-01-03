import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/utils/image_cache_manager.dart';

class NivosePage extends StatefulWidget {
  final Nivose nivose;
  const NivosePage(this.nivose);

  @override
  _NivosePageState createState() => _NivosePageState();
}

class _NivosePageState extends State<NivosePage> {
  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    repository.currentMapLoc = widget.nivose.position;
    var isFavorite = repository.isFavorite(widget.nivose);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nivose.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    repository.removeFavoriteStation(widget.nivose);
                  } else {
                    repository.addFavoriteStation(widget.nivose);
                  }
                });
              }),
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Share.share(
                  "Nivose ${widget.nivose.name}\ndonnée semaine: ${widget.nivose.urlWeek}\ndonnée saison: ${widget.nivose.urlSeason}\n"))
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              if (widget.nivose.urlWeek != null)
                Image.network(
                  widget.nivose.urlWeek,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              SizedBox(height: 5),
              if (widget.nivose.urlSeason != null)
                Image.network(
                  widget.nivose.urlSeason,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
