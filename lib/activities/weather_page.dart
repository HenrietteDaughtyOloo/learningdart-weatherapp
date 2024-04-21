import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('e156af47d704ec250f221aea5873dd70');
  Weather? _weather;

  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }
String getWeatherAnimation(String? generalisedCondition){
  if (generalisedCondition == null) return 'assets/Sunny.json';

  switch(generalisedCondition.toLowerCase()){
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/Windy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
    case 'light shower rain':
    case 'heavy shower rain':
    case 'thunderstorm with light rain':
    case 'thunderstorm with rain':
    case 'thunderstorm with heavy rain':
    case 'light thunderstorm':
    case 'thunderstorm':
    case 'heavy thunderstorm':
      return 'assets/Rainy.json';
    case 'clear':
      return 'assets/Sunny.json';
    default:
      return 'assets/Sunny.json';
    


  }
}

  @override
  void initState(){
    super.initState();
    _fetchWeather();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      const Text("Weather App"),
      
      Text(_weather?.cityName ?? "Loading the city name..."),

      Lottie.asset(getWeatherAnimation(_weather?.generalisedCondition)),
      
      Text('${_weather?.temperature.round() }°C'),

      Text(_weather?.generalisedCondition ?? "")

         ],
         ),

         
         ),

         );
  }
}