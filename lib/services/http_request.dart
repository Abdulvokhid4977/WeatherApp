import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/weather_model.dart';
class HttpRequests{
  Future<WeatherModel?> getWeather(double lat, double long) async {
    try {
      final response = await http.get(
        Uri.parse("https://weatherapi-com.p.rapidapi.com/current.json?q=$lat,$long"),
        headers: {
          'X-RapidAPI-Key': '009c5c3bedmshc50b615a00faef5p1b612bjsn6327c11c6c4c',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
        },
      );
      print(response.body);
      return weatherModelFromJson(response.body);
    }catch(e, s){
      debugPrint('Function getWeather. Error: $e. Line: $s');
      return null;
    }
  }
}