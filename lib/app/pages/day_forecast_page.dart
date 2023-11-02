import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/utils/constants.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';

import '../widgets/state_temperature_small_widget.dart';
import '../widgets/temperature_date_widget.dart';
import '../widgets/temperature_small_widget.dart';

class DayForecastPage extends StatelessWidget {
  const DayForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        appBar: AppBarWidget(
          isNext: true,
          onPreviousTap: () {},
          onNextTap: () {},
          title: Text(
            'Espírito Santo',
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: menuIconButton,
          rightIcon: reloadIconButton,
        ),
        body: Column(
          children: [
            Center(child: TemperatureDateWidget(theme: theme)),
            const SizedBox(height: 30),
            Text(
              'Hoje',
              style: theme.appBarTheme.titleTextStyle?.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 10),
                TemperatureSmallWidget(theme: theme),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Estados',
              style: theme.appBarTheme.titleTextStyle?.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                StateTemperatureSmallWidget(theme: theme),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
