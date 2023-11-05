import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/utils/helpers/information_weather_helper.dart';

import '../../models/information_weather_result.dart';

class DayWeatherTemperatureWidget extends StatelessWidget
    with InformationWeatherHelper {
  final MapEntry<DaysWeekEnum, Day> day;
  final VoidCallback onTap;
  final ThemeData theme;

  const DayWeatherTemperatureWidget({
    super.key,
    required this.theme,
    required this.day,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                day.key.label,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                getImagePath(day.value.periods.values.toList()[1].weather),
                height: 40,
                width: 55,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                day.value.periods.values.toList()[1].weather,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${day.value.periods.values.toList()[1].degrees}º',
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
