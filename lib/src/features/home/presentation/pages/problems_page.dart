import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemsPage extends StatelessWidget {
  const ProblemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorDark,
        elevation: 0,
        title: Text(
          S.of(context).muammoTuriniTanlang,
          style: TextStyle(
              color: AppColors.textColorDark,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_bg_night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: 16.h,
            right: 16.w,
            left: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                  color: AppColors.mainColorDark,
                  borderRadius: BorderRadius.circular(8.h)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 15,
                    itemBuilder: (context, index) {
                  return Column(
                    children: [
                      20.verticalSpace,
                      Text('zsdfvdrfbv $index',style: TextStyle(color: AppColors.textColorDark),),
                      20.verticalSpace,
                      Divider(height: 0.5.h,color: AppColors.dividerColor,)
                    ],
                  );
                }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
