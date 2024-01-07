import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:snow_weather_info/core/const.dart';
import 'package:snow_weather_info/router/router.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class HomePage extends ConsumerWidget {
  const HomePage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const _TitleBar(),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        items: const [
          BottomNavigationBarItem(
            label: 'Stations',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'Carte',
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            label: 'Avalanches',
            icon: Icon(Icons.rss_feed),
          ),
          BottomNavigationBarItem(
            label: 'BERA',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'Webcam',
            icon: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

enum _MenuItem {
  setting,
  about,
}

class _TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const _TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppConst.title),
      actions: <Widget>[
        PopupMenuButton<_MenuItem>(
          offset: const Offset(0, 40),
          onSelected: (_MenuItem value) async {
            return switch (value) {
              _MenuItem.setting => context.pushNamed(AppRoute.setting.name),
              _MenuItem.about => await _openAboutDialog(context),
            };
          },
          itemBuilder: (context) => <PopupMenuItem<_MenuItem>>[
            const PopupMenuItem(
              value: _MenuItem.setting,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Préférences...'),
              ),
            ),
            const PopupMenuItem(
              value: _MenuItem.about,
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('A propos...'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _openAboutDialog(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (context.mounted) {
      await showDialog<AboutDialog>(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: 'Info Neige',
            applicationVersion:
                'version: ${packageInfo.version}+${packageInfo.buildNumber}',
            applicationIcon: Image.asset(
              'assets/icon/icon.png',
              width: 42,
              height: 42,
            ),
            applicationLegalese: 'MIT',
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                'Développeur: Chonli',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              InkWell(
                onTap: () => url.launchUrl(
                  Uri.parse('https://github.com/Chonli/snow_weather_info'),
                ),
                child: Text(
                  'Lien vers le projet',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
