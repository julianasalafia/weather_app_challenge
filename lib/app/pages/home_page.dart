import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
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
        body: const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [],
              ),
              CustomBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
