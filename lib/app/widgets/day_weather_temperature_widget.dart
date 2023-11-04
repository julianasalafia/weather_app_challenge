import 'package:flutter/material.dart';

class DayWeatherTemperatureWidget extends StatelessWidget {
  const DayWeatherTemperatureWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Segunda',
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            'assets/images/cloudy.png',
            height: 40,
            width: 55,
          ),
          Text(
            'Nublado',
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '31º',
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
