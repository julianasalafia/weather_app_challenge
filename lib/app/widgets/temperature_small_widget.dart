import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TemperatureSmallWidget extends StatelessWidget {
  const TemperatureSmallWidget({
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
          height: 155,
          width: 115,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Manhã',
                style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/cloudy_weather.png',
                width: 75,
                height: 45,
              ),
              const SizedBox(height: 25),
              Text(
                '23º',
                style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
