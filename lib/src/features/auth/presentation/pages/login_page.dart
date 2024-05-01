import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/components/text_field_components.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneCon = TextEditingController();
  final passwordCon = TextEditingController();

  bool _passwordVisible = true;
  bool _errorPhone = false;
  bool _errorPassword = false;

  bool _isSave = false;

  late final bloc = context.read<AuthBloc>();

  @override
  void initState() {
    super.initState();
    setState(() {
      Prefs.getString(AppConstants.kPassword)
          .then((value) => passwordCon.setText(value ?? ""));
      Prefs.getString(AppConstants.kPhoneNumber)
          .then((value) => phoneCon.setText(value ?? ""));
      Prefs.getBool(AppConstants.kSave)
          .then((value) => _isSave = value ?? false);
    });
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoginVerified) {
            if (_isSave) {
              Prefs.setBool(AppConstants.kSave, _isSave);
              Prefs.setString(AppConstants.kPassword, passwordCon.text);
              Prefs.setString(AppConstants.kPhoneNumber, phoneCon.text);
            }
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.MAIN, (route) => false);
          }
          if (state.hasError) {
            snackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state1) {
              final bg = state1.isDark
                  ? 'assets/images/img_auth_bg_night.png'
                  : 'assets/images/img_auth_bg_light.png';
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          30.verticalSpace,
                          SizedBox(
                            height: 160.h,
                            child: Image.asset(
                              'assets/images/img_logo_${state1.lang}.png',
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            S
                                .of(context)
                                .app_name,
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          20.verticalSpace,
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: phoneCon,
                            cursorColor: Theme
                                .of(context)
                                .colorScheme
                                .tertiary,
                            onChanged: (value) {
                              setState(() {
                                _errorPhone = false;
                              });
                            },
                            style: TextStyle(fontSize: 16.sp),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme
                                  .of(context)
                                  .primaryColor,
                              labelStyle: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .tertiary),
                              labelText: S
                                  .of(context)
                                  .phone_number,
                              errorStyle: TextStyle(height: 0.h),
                              errorText: _errorPhone ? "" : null,
                              prefixText: '+998 ',
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                              prefixStyle: TextStyle(fontSize: 16.sp),
                              hintStyle: TextStyle(fontSize: 16.sp),
                              hintText: "999 99 99",
                              border: appTextFiledBorder(context),
                              enabledBorder: appTextFiledBorder(context),
                              disabledBorder: appTextFiledBorder(context),
                              focusedBorder: appTextFiledBorder(context),
                              errorBorder: appTextFiledErrorBorder(),
                            ),
                          ),
                          16.verticalSpace,
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                _errorPassword = false;
                              });
                            },
                            controller: passwordCon,
                            style: TextStyle(fontSize: 16.sp),
                            obscureText: _passwordVisible,
                            cursorColor: Theme
                                .of(context)
                                .colorScheme
                                .tertiary,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 16.sp),
                                hintText: S
                                    .of(context)
                                    .password,
                                filled: true,
                                isDense: true,
                                fillColor: Theme
                                    .of(context)
                                    .primaryColor,
                                labelStyle: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .tertiary),
                                labelText: S
                                    .of(context)
                                    .password,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                errorStyle: TextStyle(height: 0.h),
                                errorText: _errorPassword ? "" : null,
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  child: Icon(
                                    _passwordVisible
                                        ? Icons.remove_red_eye
                                        : Icons.password,
                                  ),
                                ),
                                border: appTextFiledBorder(context),
                                enabledBorder: appTextFiledBorder(context),
                                disabledBorder: appTextFiledBorder(context),
                                focusedBorder: appTextFiledBorder(context),
                                errorBorder: appTextFiledErrorBorder()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                  value: _isSave,
                                  onChanged: (value) {
                                    setState(() {
                                      _isSave = !_isSave;
                                    });
                                  },
                                  side: const BorderSide(
                                      color: AppColors.textColorDark)),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.RECOVER_PASSWORD);
                                },
                                child: Text(
                                  S
                                      .of(context)
                                      .forgot_password,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12.sp,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_one_id.svg', color: Theme
                                      .of(context)
                                      .colorScheme
                                      .tertiary,),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.ONE_ID);
                                  },
                                ),
                                5.horizontalSpace,
                                Text(S
                                    .of(context)
                                    .by_enter,
                                    style: TextStyle(fontSize: 14.sp))
                              ]),
                          20.verticalSpace,
                          state.isLoading
                              ? CircularProgressIndicator(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .tertiary,
                          )
                              : AppElevatedButton(
                              text: S
                                  .of(context)
                                  .login,
                              onClick: () {
                                {
                                  if (phoneCon.text.isNotEmpty &&
                                      passwordCon.text.isNotEmpty) {
                                    bloc.login(
                                      body: LoginBody(
                                        phone: phoneCon.text,
                                        password: passwordCon.text,
                                      ),
                                    );
                                  } else {
                                    if (phoneCon.text.isEmpty) {
                                      setState(() {
                                        _errorPhone = true;
                                      });
                                    }
                                    if (passwordCon.text.isEmpty) {
                                      setState(() {
                                        _errorPassword = true;
                                      });
                                    }
                                  }
                                }
                              }),
                          20.verticalSpace,
                          Text(
                            S
                                .of(context)
                                .akkauntingizMavjudEmasmi,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                            },
                            child: Text(
                              S
                                  .of(context)
                                  .register,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .tertiary),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
