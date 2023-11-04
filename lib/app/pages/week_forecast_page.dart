import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import 'package:weather_app_challenge/store/tempo_store.dart';
import '../widgets/day_weather_temperature_widget.dart';
import '../widgets/weather_temperature_widget.dart';

class WeekForecastPage extends StatelessWidget {
  final VoidCallback onItemTapped;
  const WeekForecastPage({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<TempoStore>(builder: (context, store, _) {
      return Scaffold(
        appBar: AppBarWidget(
          title: '7 Dias',
          onTapButton: onItemTapped,
          index: 1,
        ),
        body: Column(
          children: [
            Text(store.selectedState?.getTodayName() ?? '',
                style: theme.appBarTheme.titleTextStyle),
            WeatherTemperatureWidget(
                theme: theme,
                periodo: store.selectedState!.getToday()!.getPeriodoNow()!),
            const SizedBox(height: 50),
            DayWeatherTemperatureWidget(theme: theme),
          ],
        ),
      );
    });
  }
}
