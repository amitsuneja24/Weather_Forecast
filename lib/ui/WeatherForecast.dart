import 'package:flutter/material.dart';
import 'package:weather_forecast/model/WeatherForecastModel.dart';
import 'package:weather_forecast/ui/bottomView.dart';
import 'package:weather_forecast/util/Network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'MidView.dart';
class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecast;
  String _City='Delhi';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
forecast=ApiService().GetWeatherForecast(City:_City);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[CustomTextField(),
          Container(
            child: FutureBuilder(
              future: forecast,
              builder: (context,AsyncSnapshot<WeatherForecastModel> snapshot){
                if(snapshot.hasData)
                return  Column(
                  children: <Widget>[MidView(snapshot),
                  bottomView(context,snapshot)
                  ],
                );
                if(snapshot.hasError)
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                else
                  return Center(child: CircularProgressIndicator(),);
              },
            ),
          )
        ],
      ),
    );
  }


  Widget CustomTextField(){
    return Container(
      margin: EdgeInsets.all(10),
      child:TextField(
        onSubmitted: (String City){
          setState(() {
            _City=City;
            forecast=ApiService().GetWeatherForecast(City: _City);
          });
        },
        decoration: InputDecoration(
          hintText: 'Enter City Name',prefixIcon: Icon(Icons.search,size:30,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.all(8)
        ),
      ),
      );
  }
}
