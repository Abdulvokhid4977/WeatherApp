import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
Future<String> getWeather(double lat, double long) async {
  Uri url = Uri.parse("https://weatherapi-com.p.rapidapi.com/current.json?q=$lat,$long");
  try{
    final response =  await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': '6cf4803de0msh1100c452ea42e28p1ff90ajsne210b036c809',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
      },
    );
    return response.body;
  } catch (error) {
    debugPrint("Unexpected post error: $error");
    return '';
  }
}