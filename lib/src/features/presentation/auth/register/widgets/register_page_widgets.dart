import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  String label;
  IconData prefixIcon;

  AppTextField({super.key, required this.label, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(label,
                style: TextStyle(fontSize: 14.sp, color: Colors.white))),
        SizedBox(height: 5.h),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.mainColorDark,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15.h)),
          child: TextField(
            onChanged: (value) {

            },
            style: const TextStyle(color: AppColors.textColorDark),
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon,color: Colors.white,),
              hintStyle: const TextStyle(color: AppColors.textColorDark),
              hintText: label,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ],
    );
  }
}
