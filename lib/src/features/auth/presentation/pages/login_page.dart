import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_bg_night.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.h),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                SizedBox(
                  height: 160.h,
                  child: Image.asset(
                    'assets/images/logo_uz.png',
                  ),
                ),
                SizedBox(height: 16.h),
                Text(S.of(context).app_name,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorDark)),
                SizedBox(height: 20.h),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).phone_number,
                      style: TextStyle(
                          color: AppColors.textColorDark, fontSize: 14.sp),
                    )),
                SizedBox(height: 5.h),
                Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.h),
                      color: AppColors.mainColorDark,
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Row(
                    children: [
                      Text('+998',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white)),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {},
                          /*                      inputFormatters: [
                              MaskTextInputFormatter(
                                  initialText: '+998',
                                  mask: '(99) 999 99 99',
                                  filter: {"9": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.eager)
                            ],*/
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Parol',
                        style:
                            TextStyle(fontSize: 14.sp, color: Colors.white))),
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
                    onChanged: (value) {},
                    style: TextStyle(color: AppColors.textColorDark),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.textColorDark),
                      hintText: "Enter password here",
                      suffix: IconButton(
                        onPressed: () {},
                        icon:
                            Icon(true ? Icons.remove_red_eye : Icons.password),
                        color: AppColors.textColorDark,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    S.of(context).forgot_password,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.textColorDark,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      height: 24.h,
                      child: Image.asset('assets/images/img_one_id.png')),
                  SizedBox(width: 5.w),
                  Text(S.of(context).by_enter,
                      style: TextStyle(
                          color: AppColors.textColorDark, fontSize: 14.sp))
                ]),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.maxFinite,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColorDark,
                        borderRadius: BorderRadius.circular(10.h)),
                    child: Center(
                        child: Text(
                      S.of(context).login,
                      style: TextStyle(
                          color: AppColors.textColorDark, fontSize: 16.sp),
                    )),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  S.of(context).akkauntingizMavjudEmasmi,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.textColorDark),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.REGISTER,
                      );
                    },
                    child: Text(
                      S.of(context).royxatdanOtish,
                      style: TextStyle(
                          color: AppColors.textColorDark, fontSize: 16.sp),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
