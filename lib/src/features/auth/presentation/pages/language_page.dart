import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/app_state/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String language = 'uz';
  late final cubit = context.read<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bg = state.isDark
                ? 'assets/images/img_auth_bg_night.png'
                : 'assets/images/img_auth_bg_light.png';
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bg),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/img_logo_uz.png', height: 90.r),
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
                  cubit.changeLocale(Localization.uz, 'uz');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
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
                    language = 'en';
                  });
                  cubit.changeLocale(Localization.en, 'en');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
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
                            S.of(context).en,
                            style: TextStyle(
                                color: AppColors.textColorDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      if (language == 'en')
                        Icon(
                          Icons.check,
                          size: 20.h,
                          color: AppColors.textColorDark,
                        )
                    ],
                  ),
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap: () {
                  setState(() {
                    language = 'ru';
                  });
                  cubit.changeLocale(Localization.ru, 'ru');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
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
              20.verticalSpace,
              AppElevatedButton(text: S.of(context).next, onClick: (){
                Navigator.of(context).pushNamed(AppRoutes.LOGIN);
              })
            ],
          ),
        )
      ]),
    );
  }
}
