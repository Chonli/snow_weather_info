import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/extensions/theme_mode.dart';

class PreferencePage extends ConsumerWidget {
  const PreferencePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Préférences'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              PreferenceRow(
                text: "Thème de l'application",
                widget: DropdownButton<ThemeMode>(
                  value: ref.watch(themeModeSettingsProvider),
                  onChanged: (mode) {
                    if (mode != null) {
                      ref
                          .read(themeModeSettingsProvider.notifier)
                          .updateThemeMode(mode);
                    }
                  },
                  items: ThemeMode.values
                      .map<DropdownMenuItem<ThemeMode>>(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.displayTitle),
                        ),
                      )
                      .toList(),
                ),
              ),
              SwitchListTile(
                title: const Text('Afficher les stations sans données: '),
                value: ref.watch(showNoDataStationSettingsProvider),
                onChanged: (value) => ref
                    .read(showNoDataStationSettingsProvider.notifier)
                    .state = value,
              ),
              SwitchListTile(
                title: const Text('Regrouper les icones de la carte: '),
                value: ref.watch(showClusterLayerSettingsProvider),
                onChanged: (value) => ref
                    .read(showClusterLayerSettingsProvider.notifier)
                    .state = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreferenceRow extends StatelessWidget {
  const PreferenceRow({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$text: '),
        widget,
      ],
    );
  }
}