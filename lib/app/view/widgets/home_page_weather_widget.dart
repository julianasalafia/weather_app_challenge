import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HomePageWeatherWidget extends StatelessWidget {
  final String image;
  final String state;
  final VoidCallback onTap;

  const HomePageWeatherWidget({
    super.key,
    required this.image,
    required this.state,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 20,
            child: Container(
              height: 90,
              width: 300,
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
          ),
          Positioned(
            top: 40,
            left: 30,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 114,
                width: 145,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(image),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
