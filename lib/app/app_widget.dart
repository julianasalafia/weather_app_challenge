import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_challenge/app/pages/home_page.dart';
import 'package:weather_app_challenge/app/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: AppTheme.dark,
    );
  }
}
