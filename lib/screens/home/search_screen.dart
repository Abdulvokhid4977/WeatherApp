import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/screens/home/home_cubit.dart';
import 'package:weather_app/services/widgets.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  YandexMapController? mapController;
  List<String> recentCities = ['Toshkent'];
  void submit(String str) {
    if (recentCities.length <= 2) {
      recentCities.add(str);
      textEditingController.clear();
    } else {
      recentCities.removeAt(0);
      recentCities.add(str);
      textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.my_location),
      ),
      body: Stack(
        children: [
          YandexMap(
            mapType: MapType.vector,
            rotateGesturesEnabled: false,
            nightModeEnabled: false,
            zoomGesturesEnabled: true,
            onMapCreated: (YandexMapController yandexMapController) async {
              mapController = yandexMapController;
              mapController!.moveCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: Point(latitude: 41.2995, longitude: 69.2401),
                    zoom: 5,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 1.h,
            left: 1.w,
            right: 1.w,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.white), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {BlocProvider.of<HomeCubit>(context).getWeatherData();},
                          icon: const Icon(Icons.arrow_back),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.mic_rounded),
                          onPressed: () {},
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller: textEditingController,
                      keyboardType: TextInputType.text,
                      onSubmitted: (s) {
                        submit(s);
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBoxClass.height25,
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Recent search',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20.h),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Column(
                        children: recentCities.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.w),
                            child: Row(
                              children: [
                                const Icon(Icons.access_time_outlined),
                                SizedBoxClass.width5,
                                Text(
                                  e,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
