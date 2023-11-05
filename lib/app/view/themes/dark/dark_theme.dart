import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_challenge/app/utils/app_colors.dart';

import '../../utils/constants.dart';

class DarkTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    canvasColor: Colors.transparent,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static BoxDecoration get darkGradient => BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.purple,
            AppColors.midPurple,
            AppColors.darkerPurple,
          ],
        ),
        image: DecorationImage(
          image: const AssetImage(backgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.2),
            BlendMode.modulate,
          ),
        ),
      );
}
