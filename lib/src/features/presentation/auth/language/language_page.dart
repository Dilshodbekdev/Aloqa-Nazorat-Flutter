import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String language = 'uz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_bg_night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_uz.png', height: 90.h),
              SizedBox(height: 16.h),
              Text(
                textAlign: TextAlign.center,
                S.of(context).uz_com.toUpperCase(),
                style: TextStyle(
                    color: AppColors.textColorDark,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.h),
              Text(
                textAlign: TextAlign.center,
                S.of(context).app_name,
                style: TextStyle(
                    color: AppColors.textColorDark,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    language = 'uz';
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.h),
                      color: AppColors.mainColorDark),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/img_uz.png',
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            S.of(context).oz,
                            style: TextStyle(
                                color: AppColors.textColorDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      if (language == 'uz')
                        Icon(
                          Icons.check,
                          size: 20.h,
                          color: AppColors.textColorDark,
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    language = 'ru';
                  });
                  Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.h),
                      color: AppColors.mainColorDark),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/img_ru.png',
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            S.of(context).ru,
                            style: TextStyle(
                                color: AppColors.textColorDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      if (language == 'ru')
                        Icon(
                          Icons.check,
                          size: 20.h,
                          color: AppColors.textColorDark,
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
