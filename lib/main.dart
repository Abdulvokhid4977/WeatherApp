import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    getWeather(20.5937, 78.9629);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}

Future<String> getWeather(double lat, double long) async {
  Uri url = Uri.parse(
      "https://weatherapi-com.p.rapidapi.com/current.json?q=$lat,$long");
  try {
    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': '6cf4803de0msh1100c452ea42e28p1ff90ajsne210b036c809',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
      },
    );
    print(response.body);
    return response.body;
  } catch (error) {
    debugPrint("Unexpected post error: $error");
    return '';
  }
}
