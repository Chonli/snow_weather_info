import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';

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
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Thème de l'application",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SegmentedButton<ThemeMode>(
                segments: const <ButtonSegment<ThemeMode>>[
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.system,
                    label: Text('System'),
                    icon: Icon(Icons.calendar_view_day),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.light,
                    label: Text('Light'),
                    icon: Icon(Icons.calendar_view_week),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.dark,
                    label: Text('Dark'),
                    icon: Icon(Icons.calendar_view_month),
                  ),
                ],
                selected: {ref.watch(themeModeSettingsProvider)},
                onSelectionChanged: (mode) {
                  ref
                      .read(themeModeSettingsProvider.notifier)
                      .updateThemeMode(mode.first);
                },
              ),
            ),
            SwitchListTile(
              title: const Text('Afficher les stations sans données: '),
              value: ref.watch(showNoDataStationSettingsProvider),
              onChanged: (_) =>
                  ref.read(showNoDataStationSettingsProvider.notifier).update(),
            ),
            SwitchListTile(
              title: const Text('Regrouper les icones de la carte: '),
              value: ref.watch(showClusterLayerSettingsProvider),
              onChanged: (_) =>
                  ref.read(showClusterLayerSettingsProvider.notifier).update(),
            ),
          ],
        ),
      ),
    );
  }
}
