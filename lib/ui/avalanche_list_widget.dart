import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:webfeed/webfeed.dart';

class AvalancheListWidget extends StatelessWidget {
  const AvalancheListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feed = context.select<DataNotifier, AtomFeed>((n) => n.avalancheFeed);
    final titleStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText2.color,
      fontStyle: FontStyle.normal,
    );
    return feed != null || feed.items.length == 0
        ? ListView.builder(
            itemCount: feed.items.length,
            itemBuilder: (context, index) {
              final item = feed.items[index];
              final link = item.links.first;
              final title = item.title.replaceFirst("Avalanche le", "");
              return Card(
                margin: EdgeInsets.all(
                  8.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
                child: ListTile(
                  title: Text(
                    title,
                    style: titleStyle,
                  ),
                  trailing:
                      link != null ? Icon(Icons.navigate_next) : SizedBox(),
                  onTap: () {
                    //TODO: move to url
                  },
                ),
              );
            },
          )
        : Center(
            child: Text("Pas de donnée d'avalanche récentes"),
          );
  }
}
