import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';
import 'package:weather_forecast/util/getWeatherIcon.dart';
import 'package:weather_forecast/util/util.dart';
Widget forecastCard(AsyncSnapshot <WeatherForecastModel> snapshot,int index){
var forecastList=snapshot.data.list;
return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(util.getTime(DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000)),style: TextStyle(fontSize: 16),),
  ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forecastList[index].weather[0].main,
              color: Colors.pinkAccent
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                Text('${forecastList[index].main.tempMin.toStringAsFixed(0)} °C'),
                CircleAvatar(child: FaIcon(FontAwesomeIcons.arrowDown,size: 15,color: Colors.black,),radius: 10,backgroundColor: Colors.white,)
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${forecastList[index].main.tempMax.toStringAsFixed(0)} °C'),
                  CircleAvatar(child: FaIcon(FontAwesomeIcons.arrowUp,size: 15,color: Colors.black,),radius: 10,backgroundColor: Colors.white,)
                ],
              ),
              Text('Hum:'+'${forecastList[index].main.humidity}%'),
              Text('Win:'+'${(forecastList[index].wind.speed*3.6).toStringAsFixed(0)}km/h')
            ],
          )
        ],
      ),
    )
  ],
);
}