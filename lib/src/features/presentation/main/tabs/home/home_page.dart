import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_bg_night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.h),
                            bottomRight: Radius.circular(15.h)),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img_home.png'),
                            fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 260.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: AppColors.mainColorDark,
                        borderRadius: BorderRadius.circular(15.h)
                      ),
                      child: Row(
                        children: [
                          _circularButton('assets/icons/ic_upload.svg')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circularButton(String icon){
    return Container(
      height: 50.h,
      width: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.h),
        color: AppColors.homeCircleShapeBgColorDark
      ),
      child: SizedBox(
        height: 16.h,
          child: SvgPicture.asset(icon)),
    );
  }
}
