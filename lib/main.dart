import 'package:flutter/material.dart';
import 'package:myweatherapp/locator.dart';
import 'package:myweatherapp/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      theme: ThemeData(),
      initialRoute: '/home',
      onGenerateRoute: PreferredRoute.generatRoute,
    );
  }

  ThemeData themeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
