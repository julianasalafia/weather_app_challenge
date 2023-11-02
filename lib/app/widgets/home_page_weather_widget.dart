import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomePageWeatherWidget extends StatelessWidget {
  final String image;
  final String state;

  const HomePageWeatherWidget({
    super.key,
    required this.image,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Text(
                state,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 180,
          top: 0,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
