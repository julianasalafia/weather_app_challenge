import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_controller/weather_controller.dart';
import '../../utils/constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/day_weather_temperature_widget.dart';
import '../widgets/weather_temperature_widget.dart';

class WeekForecastPage extends StatelessWidget {
  final VoidCallback onItemTapped;
  final VoidCallback onDayTapped;

  const WeekForecastPage({
    super.key,
    required this.onItemTapped,
    required this.onDayTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<WeatherController>(builder: (context, store, _) {
      final state = store.selectedState!;
      return Scaffold(
        appBar: AppBarWidget(
          title: weekForecastTitle,
          onTapButton: onItemTapped,
          index: 1,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(state.getTodayName(),
                  style: theme.appBarTheme.titleTextStyle),
              WeatherTemperatureWidget(
                  theme: theme, period: state.getToday()!.getPeriodNow().value),
              const SizedBox(height: 50),
              // DayWeatherTemperatureWidget(theme: theme),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.days.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentDay = DateTime.now().weekday - 1;
                      final listBefore =
                          state.days.entries.toList().sublist(0, currentDay);

                      final listAfter =
                          state.days.entries.toList().sublist(currentDay);

                      final sortedList = [...listAfter, ...listBefore];

                      final day = sortedList[index];
                      return DayWeatherTemperatureWidget(
                        theme: theme,
                        day: day,
                        onTap: () {
                          store.onSelectDay(day);
                          onDayTapped();
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
