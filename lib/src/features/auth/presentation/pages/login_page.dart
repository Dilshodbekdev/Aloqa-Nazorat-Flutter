import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneCon = TextEditingController();
  final passwordCon = TextEditingController();

  late final bloc = context.read<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoginVerified) {
            Navigator.of(context).pushNamed(AppRoutes.REGISTER);
          }
        },
        builder: (context, state) {
          return Stack(
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
                    Text(S.of(context).app_name,
                        style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.textColorDark)),
                    SizedBox(height: 20.h),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).phone_number,
                          style: TextStyle(color: AppColors.textColorDark, fontSize: 14.sp),
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
                          Text('+998', style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                          Expanded(
                            child: TextField(
                              controller: phoneCon,
                              keyboardType: TextInputType.phone,
                              // onChanged: (value) {},
                              /*                      inputFormatters: [
                              MaskTextInputFormatter(
                                  initialText: '+998',
                                  mask: '(99) 999 99 99',
                                  filter: {"9": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.eager)
                            ],*/
                              style: TextStyle(color: Colors.white, fontSize: 16.sp),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Parol', style: TextStyle(fontSize: 14.sp, color: Colors.white))),
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
                        controller: passwordCon,
                        // onChanged: (value) {},
                        style: const TextStyle(color: AppColors.textColorDark),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: AppColors.textColorDark),
                          hintText: "Enter password here",
                          suffix: IconButton(
                            onPressed: () {},
                            icon: const Icon(true ? Icons.remove_red_eye : Icons.password),
                            color: AppColors.textColorDark,
                          ),
                          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        S.of(context).forgot_password,
                        style: TextStyle(
                            decoration: TextDecoration.underline, color: AppColors.textColorDark, fontSize: 12.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(height: 24.h, child: Image.asset('assets/images/img_one_id.png')),
                      SizedBox(width: 5.w),
                      Text(S.of(context).by_enter, style: TextStyle(color: AppColors.textColorDark, fontSize: 14.sp))
                    ]),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColorDark,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).login,
                            style: TextStyle(
                              color: AppColors.textColorDark,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      S.of(context).akkauntingizMavjudEmasmi,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textColorDark,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        bloc.login(
                          body: LoginBody(
                            phone: phoneCon.text,
                            password: passwordCon.text,
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).royxatdanOtish,
                        style: TextStyle(color: AppColors.textColorDark, fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
