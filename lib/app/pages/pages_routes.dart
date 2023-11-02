import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/app_routes.dart';
import 'package:weather_app_challenge/app/controllers/home_controller.dart';
import 'package:weather_app_challenge/app/pages/home_page.dart';

class PagesRoutes implements IBaseRoutes {
  @override
  Map<String, WidgetsBuilder> routes = {
    '/': (context, args) => ChangeNotifierProvider(
          builder: (context, _) {
            return HomePage(homeController: context.read());
          },
          create: (BuildContext context) {
            return HomeController();
          },
        ),
  };
}
