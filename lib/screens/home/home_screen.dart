import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/screens/home/details_screen.dart';
import 'package:weather_app/screens/home/home_cubit.dart';
import 'package:weather_app/screens/home/search_screen.dart';
import 'package:weather_app/services/widgets.dart';

import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getWeatherData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (cubitCTX, state) {
          if (state is HomeLoading) {
            debugPrint('HomeLoading state');
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),);
          }
          else if (state is HomeLoaded) {
            debugPrint('HomeLoaded state');
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(71, 191, 223, 1),
                        Color.fromRGBO(74, 145, 255, 1)
                      ])),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(cubitCTX).searchbar();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            SizedBoxClass.width20,
                            Text(
                              state.weatherModel.location.region,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                            const Icon(
                              Icons.expand_more_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          modalBottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ))
                  ],
                ),
                body: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: SvgPicture.asset('assets/cloudy.svg', fit: BoxFit
                            .contain,),
                      ),
                    ),
                    SizedBoxClass.height10,
                    Container(
                        height: 300.h,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Card(
                          elevation: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(130, 193, 248, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white70,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBoxClass.height20,
                                Text(
                                  'Today, ${DateFormat.MMMMd().format(
                                      DateTime.now())}',
                                  style: textSt(18, 5, 2.5, 2.0),
                                ),
                                SizedBoxClass.height20,
                                Text(
                                  '${state.weatherModel.current.tempC.floor()}°',
                                  style: textSt(65, 20, -2.0, 5.0),
                                ),
                                SizedBoxClass.height25,
                                Text(
                                  state.weatherModel.current.condition.text,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 7,
                                            offset: Offset(-2.5, 2.0),
                                            color: Colors.blueGrey)
                                      ]),
                                ),
                                SizedBoxClass.height25,
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/windy.svg'),
                                      SizedBoxClass.width20,
                                      Text(
                                        'Wind',
                                        style: textSt(18, 7, -2.5, 2.0),
                                      ),
                                      SizedBoxClass.width20,
                                      const VerticalDivider(
                                        color: Colors.white,
                                        thickness: 1,
                                      ),
                                      SizedBoxClass.width20,
                                      Text(
                                        '${state.weatherModel.current.windKph} km/h',
                                        style: textSt(18, 7, -2.5, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBoxClass.height25,
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/hum.svg'),
                                      SizedBoxClass.width20,
                                      Text(
                                        'Hum',
                                        style: textSt(18, 7, -2.5, 2.0),
                                      ),
                                      SizedBoxClass.width20,
                                      const VerticalDivider(
                                        color: Colors.white,
                                        thickness: 1,
                                      ),
                                      SizedBoxClass.width20,
                                      Text(
                                        '${state.weatherModel.current.humidity}%',
                                        style: textSt(18, 7, -2.5, 2.0),
                                      ),
                                      SizedBoxClass.width30,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBoxClass.height55,
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              DetailsScreen.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const Text(
                              'Forecast Report',
                              style: TextStyle(color: Colors.black87),
                            ), // <-- Text
                            SizedBoxClass.width5,
                            const Icon(
                              // <-- Icon
                              Icons.expand_more_outlined,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else if(state is HomeSearch){
            debugPrint('HomeSearch state');
            return const SearchScreen();
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
  void modalBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return const Notifications();
    });
  }

  TextStyle textSt(double fontSize, double blurRadius, double offset1,
      double offset2) {
    return TextStyle(fontSize: fontSize.sp, shadows: [
      Shadow(
          blurRadius: blurRadius,
          offset: Offset(offset1, offset2),
          color: Colors.blueGrey)
    ]);
  }
}
