import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/widgets.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = '/details';
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(71, 191, 223, 1),
            Color.fromRGBO(74, 145, 255, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Back',
            style:
                textSt(20, 7, -2.5, 2.0, FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.settings_outlined))
          ],
        ),
        body: Column(
          children: [
            SizedBoxClass.height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Text(
                    'Today',
                    style: textSt(
                      20,
                      7,
                      -2.5,
                      2.0,
                      FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Text(
                    DateFormat.MMMEd().format(
                      DateTime.now(),
                    ),
                    style: textSt(
                      17,
                      7,
                      -2.5,
                      2.0,
                      FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBoxClass.height25,
            Row(
              children: [
                Flexible(fit: FlexFit.tight, child: column('assets/icons/cloud.svg')),
                Flexible(fit: FlexFit.tight, child: column('assets/icons/cloud.svg')),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: column('assets/icons/cloud_only.svg'),
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: column('assets/icons/night.svg')),
                Flexible(fit: FlexFit.tight, child: column('assets/icons/night.svg')),
              ],
            ),
            SizedBoxClass.height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Text(
                    'Next forecast',
                    style: textSt(
                      20,
                      7,
                      -2.5,
                      2.0,
                      FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        )))
              ],
            ),
            Container(
              height: 230.h,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: RawScrollbar(
                thumbColor: Colors.white,
                trackVisibility: true,
                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (ctx, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            DateFormat.MMMMd().format(
                              DateTime.now().add(
                                Duration(days: index+1),
                              ),
                            ),
                            style: textSt(15, 7, -2.5, 2, FontWeight.bold),
                          ),
                          SvgPicture.asset(
                            'assets/icons/thunder.svg',
                            height: 60.h,
                          ),
                          Text(
                            '${next(20, 30)}°',
                            style: textSt(16, 7, -2.5, 2, FontWeight.normal),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Expanded(child: SvgPicture.asset('assets/icons/accuweather.svg')),
          ],
        ),
      ),
    );
  }
  int next(int min, int max) => min + Random().nextInt(max - min);

  Widget column(String path) {
    return Container(
      alignment: Alignment.center,
      height: 165.h,
      width: 44.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBoxClass.height10,
          Text(
            '${next(20, 30)}°',
            style: textSt(17, 7, -2.5, 2, FontWeight.normal),
          ),
          SizedBox(
            height: 90.h,

            child: SvgPicture.asset(
              path,
            fit: BoxFit.cover,

            ),
          ),
          Text(
            '17:00',
            style: textSt(17, 7, -2.5, 2, FontWeight.normal),
          ),
        ],
      ),
    );
  }

  TextStyle textSt(double fontSize, double blurRadius, double offset1,
      double offset2, FontWeight fontWeight,
      {Color? color}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        shadows: [
          Shadow(
              blurRadius: blurRadius,
              offset: Offset(offset1, offset2),
              color: Colors.blueGrey)
        ]);
  }
}
