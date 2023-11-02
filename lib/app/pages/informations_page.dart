import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import '../utils/constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/information_widget.dart';

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
                InformationWidget(
                  theme: theme,
                  image: 'assets/images/sun.png',
                  title: 'Sol',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InformationWidget(
                  theme: theme,
                  image: 'assets/images/sun.png',
                  title: 'Sol',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
