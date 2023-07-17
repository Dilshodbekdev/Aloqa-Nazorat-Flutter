import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColorDark,
        title: Text(S.of(context).shaxsiyKabinet),
      ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_bg_night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: AppColors.mainColorDark,
              borderRadius: BorderRadius.circular(8.h)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.profileContainerColor,
                    borderRadius: BorderRadius.circular(8.h)
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 32),
                      20.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Javlonbek Uchuqunov',style: TextStyle(color: AppColors.textColorDark,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                          8.verticalSpace,
                          Text('+998(91)-123-45-67 ',style: TextStyle(color: Colors.grey,fontSize: 12.sp),)
                        ],
                      )
                    ],
                  ),
                ),
                16.verticalSpace,
                Divider(color: Colors.grey,)
              ],
            ),
          ),
        ),
    );
  }
}
