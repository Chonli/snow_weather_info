import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/data/sources/api/avalanche_api.dart';
import 'package:snow_weather_info/extensions/atom_item.dart';
import 'package:snow_weather_info/router/router.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class AvalancheListWidget extends ConsumerWidget {
  const AvalancheListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedItems = ref.watch(apiAvalancheProvider);
    final titleStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color,
      fontStyle: FontStyle.normal,
    );

    return feedItems.when(
      data:
          (data) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (data != null && data.items.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: data.items.length,
                    itemBuilder: (context, index) {
                      final item = data.items[index];

                      return Card(
                        margin: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: ListTile(
                          title: Text(item.shortTitle, style: titleStyle),
                          subtitle: Text(
                            '${item.date} : ${item.massif}',
                            style: titleStyle,
                          ),
                          trailing:
                              item.url.isNotEmpty
                                  ? const Icon(Icons.navigate_next)
                                  : const SizedBox.shrink(),
                          onTap:
                              () => context.goNamed(
                                AppRoute.detailAv.name,
                                extra: item,
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
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (_, _) => const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Erreur lors du chargement des données'),
          ),
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
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Données venant du flux rss de ',
                style: TextStyle(color: bodyText2Color),
              ),
              TextSpan(
                text: 'Data Avalanche',
                style: TextStyle(color: bodyText1Color),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap =
                          () => url.launchUrl(
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
