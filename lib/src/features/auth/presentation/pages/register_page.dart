import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/components/text_field_components.dart';
import 'package:aloqa_nazorat/src/config/routes/routes.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameCon = TextEditingController();
  final surnameCon = TextEditingController();
  final midNameCon = TextEditingController();
  final passwordCon = TextEditingController();
  final phoneCon = TextEditingController();

  bool _passwordVisible = true;

  bool _errorName = false;
  bool _errorSurname = false;
  bool _errorMidName = false;
  bool _errorPassword = false;
  bool _errorPhone = false;

  late final bloc = context.read<AuthBloc>();

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
          if (state.isRegisterVerified) {
            Navigator.of(context).pushNamed(AppRoutes.CONFIRMATION);
          }
          if (state.hasError) {
            snackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Stack(children: [
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state1) {
                final bg = state1.isDark
                    ? 'assets/images/img_auth_bg_night.png'
                    : 'assets/images/img_auth_bg_light.png';
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bg),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    50.verticalSpace,
                    Image.asset(
                      'assets/images/img_logo_uz.png',
                      height: 60.h,
                    ),
                    16.verticalSpace,
                    Text(S.of(context).register,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    16.verticalSpace,
                    //name
                    TextField(
                      controller: nameCon,
                      onChanged: (value) {
                        setState(() {
                          _errorName = false;
                        });
                      },
                      style: TextStyle(fontSize: 16.sp),
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                        errorStyle: TextStyle(height: 0.h),
                        errorText: _errorName ? "" : null,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        labelText: S.of(context).name,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        border: appTextFiledBorder(context),
                        enabledBorder: appTextFiledBorder(context),
                        disabledBorder: appTextFiledBorder(context),
                        focusedBorder: appTextFiledBorder(context),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                    ),
                    16.verticalSpace,
                    //surname
                    TextField(
                      controller: surnameCon,
                      onChanged: (value) {
                        setState(() {
                          _errorSurname = false;
                        });
                      },
                      style: TextStyle(fontSize: 16.sp),
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                        errorStyle: TextStyle(height: 0.h),
                        errorText: _errorSurname ? "" : null,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        labelText: S.of(context).surname,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        border: appTextFiledBorder(context),
                        enabledBorder: appTextFiledBorder(context),
                        disabledBorder: appTextFiledBorder(context),
                        focusedBorder: appTextFiledBorder(context),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                    ),
                    16.verticalSpace,
                    //midName
                    TextField(
                      controller: midNameCon,
                      onChanged: (value) {
                        setState(() {
                          _errorMidName = false;
                        });
                      },
                      style: TextStyle(fontSize: 16.sp),
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                        errorStyle: TextStyle(height: 0.h),
                        errorText: _errorMidName ? "" : null,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        labelText: S.of(context).mid_name,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        border: appTextFiledBorder(context),
                        enabledBorder: appTextFiledBorder(context),
                        disabledBorder: appTextFiledBorder(context),
                        focusedBorder: appTextFiledBorder(context),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                    ),
                    16.verticalSpace,
                    //password
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _errorPassword = false;
                        });
                      },
                      controller: passwordCon,
                      style: TextStyle(fontSize: 16.sp),
                      obscureText: _passwordVisible,
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 16.sp),
                          hintText: S.of(context).password,
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                          labelText: S.of(context).password,
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
                    16.verticalSpace,
                    //phone
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneCon,
                      onChanged: (value) {
                        setState(() {
                          _errorPhone = false;
                        });
                      },
                      style: TextStyle(fontSize: 16.sp),
                      cursorColor: Theme.of(context).colorScheme.tertiary,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).primaryColor,
                        filled: true,
                        errorStyle: TextStyle(height: 0.h),
                        errorText: _errorPhone ? "" : null,
                        prefixText: '+998 ',
                        prefixIcon: const Icon(Icons.phone),
                        prefixStyle: TextStyle(fontSize: 16.sp),
                        hintText: "999 99 99",
                        labelText: S.of(context).phone_number,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        border: appTextFiledBorder(context),
                        enabledBorder: appTextFiledBorder(context),
                        disabledBorder: appTextFiledBorder(context),
                        focusedBorder: appTextFiledBorder(context),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                    ),
                    20.verticalSpace,
                    state.isLoading
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.tertiary,
                          )
                        : AppElevatedButton(
                            text: S.of(context).register,
                            onClick: () {
                              {
                                //Navigator.of(context).pushNamed(AppRoutes.MAIN);
                                if (nameCon.text.isNotEmpty &&
                                    surnameCon.text.isNotEmpty &&
                                    midNameCon.text.isNotEmpty &&
                                    passwordCon.text.isNotEmpty &&
                                    phoneCon.text.isNotEmpty) {
                                  bloc.register(
                                      body: RegisterBody(
                                          firstName: nameCon.text,
                                          lastName: surnameCon.text,
                                          midName: midNameCon.text,
                                          phone: phoneCon.text,
                                          password: passwordCon.text,
                                          deviceKey: "xfgb"));
                                } else {
                                  if (nameCon.text.isEmpty) {
                                    setState(() {
                                      _errorName = true;
                                    });
                                  }
                                  if (surnameCon.text.isEmpty) {
                                    setState(() {
                                      _errorSurname = true;
                                    });
                                  }
                                  if (midNameCon.text.isEmpty) {
                                    setState(() {
                                      _errorMidName = true;
                                    });
                                  }
                                  if (passwordCon.text.isEmpty) {
                                    setState(() {
                                      _errorPassword = true;
                                    });
                                  }
                                  if (phoneCon.text.isEmpty) {
                                    setState(() {
                                      _errorPhone = true;
                                    });
                                  }
                                }
                                //bloc.register(body: RegisterBody());
                              }
                            })
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
