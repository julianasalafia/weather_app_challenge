import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class WeatherTemperatureWidget extends StatelessWidget {
  const WeatherTemperatureWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 170,
        width: 387,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/cloudy.png'),
            Text(
              '23º',
              style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 55),
            ),
          ],
        ),
      ),
    );
  }
}
