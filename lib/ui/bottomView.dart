import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';

import 'forecastCard.dart';

Widget bottomView(BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList=snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text('24-Hours Weather Forecast'.toUpperCase(),style: TextStyle(fontSize: 14,color: Colors.brown),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=>SizedBox(width: 8,),
            itemCount: forecastList.length,
          itemBuilder: (context,index)=>ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width/2.7,
              child: forecastCard(snapshot,index),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.white],
                begin: Alignment.topLeft,end: Alignment.bottomRight)
              ),
            ),
          ),
        ),
      )

    ],
  );

}