import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/information_weather_helper.dart';
import 'package:weather_app_challenge/app/utils/extensions/date_time_extension.dart';

import '../../models/information_weather_result.dart';

class TemperatureDateWidget extends StatelessWidget
    with InformationWeatherHelper {
  final ThemeData theme;
  final MapEntry<DaysWeekEnum, Day> day;

  const TemperatureDateWidget({
    super.key,
    required this.theme,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final period = day.value.getPeriodNow();
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          day.key.label,
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: Image.asset(
            getImagePath(period.value.weather),
            fit: BoxFit.contain,
          ),
        ),
        Text(
          '${period.value.degrees}º',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 81,
          ),
        ),
        Text(
          DateTime.now().toPTBR(),
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
            height: 0.1,
          ),
        ),
      ],
    );
  }
}
