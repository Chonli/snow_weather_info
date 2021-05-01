import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/extensions.dart';
import 'package:dart_rss/dart_rss.dart';

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

    return feed?.items?.isNotEmpty ?? false
        ? ListView.builder(
            itemCount: feed.items.length,
            itemBuilder: (context, index) {
              final item = feed.items[index];

              return Card(
                margin: const EdgeInsets.all(
                  8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: ListTile(
                  title: Text(
                    item.shortTitle,
                    style: titleStyle,
                  ),
                  subtitle: Text(
                    '${item.date} : ${item.massif}',
                    style: titleStyle,
                  ),
                  trailing: item.url != null
                      ? const Icon(Icons.navigate_next)
                      : const SizedBox(),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => AppWebPage(
                        title: item.shortTitle,
                        url: item.url,
                        canIsOpen: true,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text("Pas de donnée d'avalanche récentes"),
          );
  }
}
