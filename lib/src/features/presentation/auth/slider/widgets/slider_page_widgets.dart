import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  String text;

  AppButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.buttonColorDark,
        borderRadius: BorderRadius.circular(10.h)
      ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 16.sp),)),
    );
  }
}
