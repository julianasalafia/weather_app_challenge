import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/pages/pages_routes.dart';

typedef WidgetsBuilder = Widget Function(BuildContext context, Object? params);

abstract class IBaseRoutes {
  abstract Map<String, WidgetsBuilder> routes;
}

class AppRoutes {
  static List<IBaseRoutes> routes = [
    PagesRoutes(),
  ];

  static const String initialRoute = '/';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    for (var route in routes) {
      if (route.routes.containsKey(settings.name)) {
        return MaterialPageRoute(
          builder: (context) => route.routes[settings.name]!(context, args),
        );
      }
    }
    return MaterialPageRoute(
      builder: (context) => Container(),
    );
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
