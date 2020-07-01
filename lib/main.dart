import 'package:flutter/material.dart';
import 'file:///C:/Flutter_Apps/weather_forecast/lib/ui/WeatherForecast.dart';

void main() {
  runApp(MaterialApp(
    home: WeatherForecast(),
    theme: CustomThemeData(),
  ));
}

ThemeData CustomThemeData() {
  return ThemeData(
    primaryColor: Color(0xFF0097A7)
  );
}
