import 'dart:async';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SLIDER, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
          children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_bg_night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).uz_com,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.textColorDark,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/logo_uz.png', height: 217.h),
            Text(
              textAlign: TextAlign.center,
              S.of(context).uz_com,
              style: TextStyle(
                  color: AppColors.textColorDark,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ]),
    );
  }
}
