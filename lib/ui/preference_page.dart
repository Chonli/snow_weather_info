import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
import 'package:snow_weather_info/extensions/theme_mode.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  value: context.select<PreferenceNotifier, ThemeMode>(
                    (n) => n.themeMode,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<PreferenceNotifier>().themeMode = value;
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
                value: context.select<PreferenceNotifier, bool>(
                  (n) => n.viewNoDataStation,
                ),
                onChanged: (value) => context
                    .read<PreferenceNotifier>()
                    .viewNoDataStation = value,
              ),
              SwitchListTile(
                title: const Text('Regrouper les icones de la carte: '),
                value: context.select<PreferenceNotifier, bool>(
                  (n) => n.showClusterLayer,
                ),
                onChanged: (value) =>
                    context.read<PreferenceNotifier>().showClusterLayer = value,
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
    Key? key,
    required this.text,
    required this.widget,
  }) : super(key: key);

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
