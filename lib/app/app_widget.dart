import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/pages/home_page.dart';
import 'package:weather_app_challenge/app/services/http/http_service_dio.dart';
import 'package:weather_app_challenge/app/services/http/i_http_service.dart';
import 'package:weather_app_challenge/app/themes/app_theme.dart';

import '../store/tempo_store.dart';

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
          create: (context) => TempoStore(
            service: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: AppTheme.dark,
      ),
    );
  }
}
