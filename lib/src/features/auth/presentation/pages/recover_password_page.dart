import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/components/text_field_components.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  late final bloc = context.read<AuthBloc>();
  final phoneCon = TextEditingController();
  bool _errorPhone = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Text(
            S.of(context).parolniTiklash,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          content: SvgPicture.asset(
            'assets/icons/ic_recover_passwors_dialog.svg',
            height: 160,
          ),
          actions: <Widget>[
            Text(
              S
                  .of(context)
                  .sizningTelefonRaqamingizgaVaqtinchalikParolJonatildiTizmgaKirganingizdanSongAlbatta,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.buttonColorDark),
              child: Text(
                S.of(context).ha,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
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
          if (state.isRecoverPasswordVerified) {
            if (state.recoverPasswordModel?.data != null) {
              _showMyDialog();
            } else {
              snackBar(
                  "User not found or code is wrong. Profile not activated");
              Navigator.pop(context);
            }
          }
          if (state.hasError) {
            snackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.verticalSpace,
                    Image.asset(
                      'assets/images/img_logo_uz.png',
                      height: 60.h,
                    ),
                    16.verticalSpace,
                    Text(
                      S.of(context).parolniTiklash,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      S
                          .of(context)
                          .parolingizniTiklashUchunRoyxatdanOtganTelefonRaqamingizniKiritingVaBiz,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    24.verticalSpace,
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
                        filled: true,
                        fillColor: Theme.of(context).primaryColor,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                        labelText: S.of(context).phone_number,
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
                    48.verticalSpace,
                    state.isLoading
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.tertiary,
                          )
                        : AppElevatedButton(
                            text: S.of(context).yuborish,
                            onClick: () {
                              if (phoneCon.text.isNotEmpty) {
                                bloc.recoverPassword(
                                    body: RecoverPasswordBody(
                                        phone: int.parse(phoneCon.text)));
                              } else {
                                setState(() {
                                  _errorPhone = true;
                                });
                              }
                            },
                          ),
                    10.verticalSpace
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
