import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferenceInfoPage extends StatefulWidget {
  const ReferenceInfoPage({super.key});

  @override
  State<ReferenceInfoPage> createState() => _ReferenceInfoPageState();
}

class _ReferenceInfoPageState extends State<ReferenceInfoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              indicatorColor: AppColors.bottomLineColor,
              unselectedLabelStyle:
              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              unselectedLabelColor: AppColors.textColorDark,
              labelColor: AppColors.bottomLineColor,
              labelStyle:
              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              tabs: [
                Tab(text: S.of(context).murojaat),
                Tab(text: S.of(context).malumot),
                Tab(text: S.of(context).javob),
              ]),
          elevation: 0,
          backgroundColor: AppColors.mainColorDark,
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).meningMurojaatlarim,
            style: TextStyle(color: AppColors.textColorDark, fontSize: 16.sp),
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
            child: TabBarView(
              children: [
                ListView.builder(
                    itemCount: 10,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: AppColors.bottomLineColor,
                            borderRadius: BorderRadius.circular(8.h)),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                              color: AppColors.mainColorDark,
                              borderRadius: BorderRadius.circular(8.h)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Veb-saytlar (domen nomlari, xosting va hokazolar) boyicha',
                                style: TextStyle(
                                    color: AppColors.textColorDark,
                                    fontSize: 14.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.h),
                                        color: AppColors.sentColor
                                            .withOpacity(0.1)),
                                    child: Text(
                                      'Ijroga yuborildi',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.sentColor),
                                    ),
                                  ),
                                  Text(
                                    '30.03.2023',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 10,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: AppColors.bottomLineColor,
                            borderRadius: BorderRadius.circular(8.h)),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                              color: AppColors.mainColorDark,
                              borderRadius: BorderRadius.circular(8.h)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Veb-saytlar (domen nomlari, xosting va hokazolar) boyicha',
                                style: TextStyle(
                                    color: AppColors.textColorDark,
                                    fontSize: 14.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.h),
                                        color: AppColors.sentColor
                                            .withOpacity(0.1)),
                                    child: Text(
                                      'Ijroga yuborildi',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.sentColor),
                                    ),
                                  ),
                                  Text(
                                    '30.03.2023',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 10,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: AppColors.bottomLineColor,
                            borderRadius: BorderRadius.circular(8.h)),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                              color: AppColors.mainColorDark,
                              borderRadius: BorderRadius.circular(8.h)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Veb-saytlar (domen nomlari, xosting va hokazolar) boyicha',
                                style: TextStyle(
                                    color: AppColors.textColorDark,
                                    fontSize: 14.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.h),
                                        color: AppColors.sentColor
                                            .withOpacity(0.1)),
                                    child: Text(
                                      'Ijroga yuborildi',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.sentColor),
                                    ),
                                  ),
                                  Text(
                                    '30.03.2023',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
