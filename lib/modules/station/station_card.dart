import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/provider/station_data.dart';
import 'package:snow_weather_info/provider/station_piemont_data.dart';
import 'package:snow_weather_info/router/router.dart';

extension _ThemeExt on BuildContext {
  Color? textColor(bool hasData) => hasData
      ? Theme.of(this).textTheme.bodyMedium?.color
      : Theme.of(this).disabledColor;

  FontStyle textFont(bool hasData) =>
      hasData ? FontStyle.normal : FontStyle.italic;

  TextStyle stationTextStyle(bool hasData) => TextStyle(
    color: textColor(hasData),
    fontStyle: textFont(hasData),
  );
}

class StationCard extends ConsumerWidget {
  const StationCard({
    required this.station,
    super.key,
  });

  final AbstractStation station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final TextStyle textStyle;
    late final String snowHeigth;

    if (station case final Station st) {
      final hasData = ref.watch(stationDataProvider.notifier).hasData(st.id);
      final lastSnowHeight = ref
          .watch(stationDataProvider.notifier)
          .lastSnowHeight(st.id);

      snowHeigth = hasData
          ? ' ${(lastSnowHeight * 100).toStringAsFixed(0)}cm'
          : '';
      textStyle = context.stationTextStyle(hasData);
    } else if (station case final StationPiemont st) {
      final hasData = ref
          .watch(stationPiemontDataProvider.notifier)
          .hasData(st.id);
      final lastSnowHeight = ref
          .watch(stationPiemontDataProvider.notifier)
          .lastSnowHeight(st.id);

      snowHeigth = hasData
          ? ' ${(lastSnowHeight * 100).toStringAsFixed(0)}cm'
          : '';

      textStyle = context.stationTextStyle(hasData);
    } else {
      snowHeigth = '';
      textStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontStyle: FontStyle.normal,
      );
    }

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(
          station.name,
          style: textStyle,
        ),
        isThreeLine: true,
        trailing: snowHeigth.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.ac_unit),
                  Text(snowHeigth),
                ],
              )
            : null,
        subtitle: Text(
          '${station.altitude}m \nLatLng(${station.position.latitude},${station.position.longitude})',
          style: textStyle,
        ),
        onTap: () {
          ref
              .read(currentMapLocProvider.notifier)
              .setLocation(station.position);

          context.goNamed(
            AppRoute.detailSt.name,
            extra: station,
          );
        },
      ),
    );
  }
}
