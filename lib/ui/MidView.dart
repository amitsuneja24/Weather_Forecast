import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';
import 'package:weather_forecast/util/getWeatherIcon.dart';
import 'package:weather_forecast/util/util.dart';

Widget MidView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var date = forecastList[0].dt * 1000;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$city, $country',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
              '${util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(date))}'),
          SizedBox(
            height: 10,
          ),
          getWeatherIcon(weatherDescription:forecastList[0].weather[0].main, size:193, color:Colors.pinkAccent),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${forecastList[0].main.temp.toStringAsFixed(0)} °C',
                  style: TextStyle(fontSize: 34),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('${forecastList[0].weather[0].main.toUpperCase()}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '${(forecastList[0].wind.speed * 3.6).toStringAsFixed(1)} km/h'),
                      FaIcon(FontAwesomeIcons.wind,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${forecastList[0].main.humidity} %'),
                      FaIcon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${forecastList[0].main.tempMax.toStringAsFixed(0)} °C'),
                      FaIcon(FontAwesomeIcons.temperatureHigh,color: Colors.brown,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
