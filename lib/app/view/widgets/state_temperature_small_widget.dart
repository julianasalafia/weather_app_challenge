import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/information_weather_helper.dart';

import '../../models/information_weather_result.dart';
import '../../utils/app_colors.dart';

class StateTemperatureSmallWidget extends StatelessWidget
    with InformationWeatherHelper {
  final StateInfo state;
  final ThemeData theme;

  const StateTemperatureSmallWidget({
    super.key,
    required this.theme,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final day = state.getToday();
    final period = day!.periods.values.first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.lightPurple,
                  AppColors.lightMidPurple,
                ],
              ),
            ),
            height: 50,
            width: 156,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset(
                    getImagePath(period.weather),
                    width: 37,
                    height: 30,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    state.state,
                    style: theme.appBarTheme.titleTextStyle
                        ?.copyWith(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${period.degrees}º',
                    style: theme.appBarTheme.titleTextStyle
                        ?.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
