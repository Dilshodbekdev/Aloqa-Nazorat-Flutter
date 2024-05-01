import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const AppElevatedButton(
      {super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: AppColors.buttonColorDark),
        onPressed: () => onClick(),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
