import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';

import '../utils/constants.dart';
import '../widgets/day_weather_temperature_widget.dart';
import '../widgets/weather_temperature_widget.dart';

class WeekForecastPage extends StatelessWidget {
  const WeekForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        appBar: AppBarWidget(
          isNext: false,
          onPreviousTap: () {},
          onNextTap: () {},
          title: Text(
            '7 Dias',
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: Column(
          children: [
            Text('Segunda', style: theme.appBarTheme.titleTextStyle),
            WeatherTemperatureWidget(theme: theme),
            const SizedBox(height: 50),
            DayWeatherTemperatureWidget(theme: theme),
          ],
        ),
      ),
    );
  }
}
