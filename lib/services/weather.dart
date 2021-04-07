// import 'package:flutter/material.dart';
import 'networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName, String apiKey) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = networkHelper.getData();
    return weatherData;
  }
}
