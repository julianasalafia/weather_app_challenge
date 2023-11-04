import 'package:flutter/material.dart';
import '../widgets/day_weather_temperature_widget.dart';
import '../widgets/weather_temperature_widget.dart';

class WeekForecastPage extends StatelessWidget {
  const WeekForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Text('Segunda', style: theme.appBarTheme.titleTextStyle),
          WeatherTemperatureWidget(theme: theme),
          const SizedBox(height: 50),
          DayWeatherTemperatureWidget(theme: theme),
        ],
      ),
    );
  }
}
