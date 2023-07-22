import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/services/widgets.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBoxClass.height10,
            Container(
              width: 35.w,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 2.w, color: Colors.black26))),
            ),
            SizedBoxClass.height25,
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
                child: Text(
                  'Your notification',
                  style: txStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      isShadowed: true,
                      blurRadius: 7,
                      offset1: -2.5,
                      offset2: 2.0,
                      colors: Colors.black26),
                  textAlign: TextAlign.start,
                )),
            SizedBoxClass.height20,
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                'New',
                style: txStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    isShadowed: false),
              ),
            ),
            SizedBoxClass.height20,
            list(
                'assets/icons/sun_icon.svg',
                '10 minutes ago',
                'Sunny day in your location, consider wearing your UV protection',
                Colors.black),
            SizedBoxClass.height25,
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                'Earlier',
                style: txStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    isShadowed: false),
              ),
            ),
            SizedBoxClass.height25,
            list(
                'assets/icons/windy.svg',
                '1 day ago',
                'A cloudy day will occur all day long, don\'t worry about the heat of the sun',
                Colors.black45),
            SizedBoxClass.height25,
            list(
                'assets/icons/raini.svg',
                '1 day ago',
                'Potential for the rain is 84%, don\'t forget to bring your umbrella',
                Colors.black45),
            SizedBoxClass.height25,
          ],
        ),
      ),
    );
  }

  TextStyle txStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    required bool isShadowed,
    double? blurRadius,
    double? offset1,
    double? offset2,
    Color? colors,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      shadows: [
        isShadowed == true && blurRadius != null
            ? Shadow(
                blurRadius: blurRadius,
                offset: const Offset(-2.5, 2.0),
                color: Colors.black26)
            : const Shadow()
      ],
    );
  }

  ListTile list(String path, String text1, String text2, Color color) {
    return ListTile(
      leading: SvgPicture.asset(
        path,
        color: color,
      ),
      title: Container(
        margin: EdgeInsets.only(left: 10.w, bottom: 5.h),
        child: Text(text1,
            style: txStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.normal,
                isShadowed: false)),
      ),
      subtitle: Container(
        margin: EdgeInsets.only(left: 10.w),
        child: Text(
          text2,
          style: txStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              isShadowed: false),
          softWrap: true,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.expand_more_outlined,
          color: color,
        ),
      ),
    );
  }
}
