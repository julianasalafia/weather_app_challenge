import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/utils/constants.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/home_page_weather_widget.dart';

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
          onPreviousTap: () async {
            // TODO
          },
          title: Text(
            toolbarSearchTitle,
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: HomePageWeatherWidget(
                  image: 'assets/images/cloudy_weather.png',
                  state: 'Ceará',
                ),
              ),
              CustomBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
