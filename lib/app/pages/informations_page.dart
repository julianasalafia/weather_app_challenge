import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/utils/app_colors.dart';

import '../utils/constants.dart';
import '../widgets/app_bar_widget.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        appBar: AppBarWidget(
          isNext: false,
          onPreviousTap: () {
            // TODO
          },
          title: Text(
            'Informações',
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/sun.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sol',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/rainy_weather.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nublado',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/rainy_night.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Chuva',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/snow_weather.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Neve',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/windy_storm.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tempestade',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.purplePureDark.withOpacity(0.23),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                          'assets/images/cloud_rain_and_lightning.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Trovão',
                      style: theme.appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
