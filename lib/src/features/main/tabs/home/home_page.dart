import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_bg_night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.h),
                            bottomRight: Radius.circular(15.h)),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img_home.png'),
                            fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 240.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: AppColors.mainColorDark,
                          borderRadius: BorderRadius.circular(15.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _circularButton('assets/icons/ic_upload.svg'),
                          _circularButton('assets/icons/ic_upload.svg'),
                          _circularButton('assets/icons/ic_upload.svg'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Assalomu aleykum',style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                        Text('Dilshodbek',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      ],
                    ),
                          SizedBox(
                            width: 26.h,
                            height: 26.h,
                            child: Stack(
                              children: [
                                Align(
                                    child: Icon(Icons.notifications,size: 24.h,color: Colors.white,),
                                  alignment: Alignment.bottomLeft,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 12.h,
                                    width: 12.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(7.h)
                                    ),
                                    child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize: 10.sp),)),
                                  ),
                                )
                              ],
                            ),
                          )
                  ],))
                ],
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                S.of(context).muammoingizgaTegishliBolimniTanlang,
                style: TextStyle(
                    color: AppColors.textColorDark,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return _itemCategory((){
                                Navigator.of(context).pushNamed(AppRoutes.PROBLEMS);
                              });
                            }),
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 80.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.h),
                          border: Border.all(
                              color: AppColors.bottomLineColor, width: 1.h)),
                      child: Center(
                          child: Text(
                        'Call Center 1111',
                        style: TextStyle(
                            color: AppColors.textColorDark, fontSize: 18.sp),
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemCategory(Function function) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
        padding: EdgeInsets.only(bottom: 1.h),
        decoration: BoxDecoration(
            color: AppColors.bottomLineColor,
            borderRadius: BorderRadius.circular(6.h)),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.mainColorDark,
              borderRadius: BorderRadius.circular(6.h)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_android,
                size: 32.h,
                color: AppColors.textColorDark,
              ),
              4.verticalSpace,
              Text(
                'Mobil aloqa xizmatlari',
                style: TextStyle(
                    color: AppColors.textColorDark,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _circularButton(String icon) {
    return Container(
      height: 40.h,
      width: 40.h,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.h),
          color: AppColors.homeCircleShapeBgColorDark),
      child: SizedBox(height: 16.h, child: SvgPicture.asset(icon)),
    );
  }
}
