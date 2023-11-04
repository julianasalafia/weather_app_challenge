import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class StateTemperatureSmallWidget extends StatelessWidget {
  final String state;

  StateTemperatureSmallWidget({
    super.key,
    required this.theme,
    required this.state,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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
                    'assets/images/cloudy.png',
                    width: 37,
                    height: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    state,
                    style: theme.appBarTheme.titleTextStyle
                        ?.copyWith(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '9ºC',
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
