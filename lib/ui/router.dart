import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myweatherapp/ui/views/weather_view.dart';

class PreferredRoute {
  static Route<dynamic> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => WeatherView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
