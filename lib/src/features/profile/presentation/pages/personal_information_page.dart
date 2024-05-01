  import 'dart:convert';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).shaxsiyMalumotlar,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bg = state.isDark
              ? 'assets/images/img_bg_night.jpg'
              : 'assets/images/img_bg_light.jpg';
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Positioned(
                top: 12.h,
                right: 12.w,
                left: 12.w,
                child: FutureBuilder(
                  future: Prefs.getString(AppConstants.kUser),
                  builder: (context, snapshot) {
                    UserData? userData;
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data != null) {
                      userData = UserData.fromJson(jsonDecode(snapshot.data!));
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).surname,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                            2.verticalSpace,
                            Text(
                              userData?.lastName ?? "--",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            16.verticalSpace,
                            Text(
                              S.of(context).name,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                            2.verticalSpace,
                            Text(
                              userData?.firstName ?? "--",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            16.verticalSpace,
                            Text(
                              S.of(context).mid_name,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                            2.verticalSpace,
                            Text(
                              userData?.midName ?? "--",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            16.verticalSpace,
                            Text(
                              S.of(context).tugilganKun,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                            2.verticalSpace,
                            Text(
                              userData?.birthDate ?? "--",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            16.verticalSpace,
                            Text(
                              S.of(context).email,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                            2.verticalSpace,
                            Text(
                              userData?.email ?? "--",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
