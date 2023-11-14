import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class AvalancheListWidget extends ConsumerWidget {
  const AvalancheListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedItems = [];
    //  ref.watch(
    //   dataNotifier.select(
    //     (n) => n.avalancheFeed?.items ?? [],
    //   ),
    // );
    final titleStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color,
      fontStyle: FontStyle.normal,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (feedItems.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: feedItems.length,
              itemBuilder: (context, index) {
                final item = feedItems[index];

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
                    trailing: item.url.isNotEmpty
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
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("Pas de donnée d'avalanche récente"),
          ),
        const _AttributionWidget(),
      ],
    );
  }
}

class _AttributionWidget extends StatelessWidget {
  const _AttributionWidget();

  @override
  Widget build(BuildContext context) {
    final bodyText2Color = Theme.of(context).textTheme.bodyMedium?.color;
    final bodyText1Color = Theme.of(context).textTheme.bodyLarge?.color;

    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Données venant du flux rss de ',
                style: TextStyle(
                  color: bodyText2Color,
                ),
              ),
              TextSpan(
                text: 'Data Avalanche',
                style: TextStyle(
                  color: bodyText1Color,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => url.launchUrl(
                        Uri.parse('http://www.data-avalanche.org/'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
