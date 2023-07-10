import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/routes.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/register/widgets/register_page_widgets.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/slider/widgets/slider_page_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_bg_night.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Image.asset(
                  'assets/images/logo_uz.png',
                  height: 60.h,
                ),
                SizedBox(height: 16.h),
                Text(S.of(context).register,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorDark)),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  label: S.of(context).name,
                  prefixIcon: CupertinoIcons.person,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  label: S.of(context).surname,
                  prefixIcon: CupertinoIcons.person,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  label: S.of(context).mid_name,
                  prefixIcon: CupertinoIcons.person,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  label: S.of(context).email,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(S.of(context).password,
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
                      hintText: S.of(context).password,
                      suffix: IconButton(
                        onPressed: () {},
                        icon:
                            Icon(true ? Icons.remove_red_eye : Icons.password),
                        color: AppColors.textColorDark,
                      ),
                      border: const OutlineInputBorder(
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
                SizedBox(
                  height: 10.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).phone_number,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
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
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.MAIN);
                  },
                    child: AppButton(text: S.of(context).register)),
                SizedBox(height: 16.h,)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
