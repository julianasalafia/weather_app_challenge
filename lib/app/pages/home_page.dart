import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/utils/app_colors.dart';
import 'package:weather_app_challenge/app/utils/constants.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';

import '../widgets/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(
          isNext: false,
          onPreviousTap: () {
            // TODO
          },
          title: Text(
            toolbarSearchTitle,
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 321,
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
                    ),
                    Positioned(
                      left: 200,
                      top: -20,
                      child: Image.asset(
                        'assets/images/cloudy_weather.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const CustomBottomBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
