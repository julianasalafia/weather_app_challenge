import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class StateTemperatureSmallWidget extends StatelessWidget {
  const StateTemperatureSmallWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cloudy_weather.png',
                width: 37,
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(
                'Ceará',
                style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
              ),
              const SizedBox(width: 25),
              Text(
                '9º',
                style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
