import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/http_request.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
Future<void> getWeatherData() async{
  WeatherModel? weatherMod=await HttpRequests().getWeather(41.2995, 69.2401);
  if(weatherMod==null) {
    emit(ErrorState('Model is null'));
  }
  else {
    emit(HomeLoaded(weatherMod));
  }
  }
  void searchbar(){
  emit(HomeSearch());
  }
}

