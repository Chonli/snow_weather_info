import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/theme.dart';
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
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Thème de l'application: "),
                DropdownButton<ThemeMode>(
                  value: context.watch<ThemeNotifier>().themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<ThemeNotifier>().themeMode = value;
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
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
