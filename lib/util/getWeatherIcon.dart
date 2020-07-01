import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription, double size, Color color}){

  switch(weatherDescription){
    case 'Clear':
      {
        return FaIcon(FontAwesomeIcons.sun,size: size,color: color,);
      }
    case 'Clouds':
      {
        return FaIcon(FontAwesomeIcons.cloud,size: size,color: color,);
      }
    case 'Rain':
      {
        return FaIcon(FontAwesomeIcons.cloudRain,size: size,color: color,);
      }
    case 'Snow':
      {
        return FaIcon(FontAwesomeIcons.snowman,size: size,color: color,);
      }
    default:
      {
        return FaIcon(FontAwesomeIcons.sun,size: size,color: color,);
      }
  }

}