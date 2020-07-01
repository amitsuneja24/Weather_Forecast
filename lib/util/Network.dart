import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/WeatherForecastModel.dart';
import 'package:weather_forecast/util/util.dart';

class ApiService{
Future<WeatherForecastModel> GetWeatherForecast({String City}) async{
final Url= 'http://api.openweathermap.org/data/2.5/forecast?q='+'$City'+'&cnt=8&units=metric&appid='+'${util.key}';
final response = await http.get(Uri.encodeFull(Url));
return WeatherForecastModel.fromJson((json.decode(response.body)));
}
}