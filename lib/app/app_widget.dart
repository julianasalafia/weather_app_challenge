import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/controller/http_controller/http_service_dio.dart';
import 'package:weather_app_challenge/app/view/themes/app_theme.dart';
import 'package:weather_app_challenge/main_page.dart';

import 'controller/http_controller/i_http_service.dart';
import 'controller/weather_controller/weather_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiProvider(
      providers: [
        Provider<IHttpService>(create: (_) => HttpServiceDio()),
        ChangeNotifierProvider(
          create: (context) => WeatherController(
            service: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
        theme: AppTheme.dark,
      ),
    );
  }
}
