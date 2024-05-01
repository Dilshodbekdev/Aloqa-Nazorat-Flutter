import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/routes/routes.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  late final bloc = context.read<AuthBloc>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
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
    final defaultPinTheme = PinTheme(
      width: 35.h,
      height: 35.h,
      textStyle: TextStyle(color: AppColors.textColorDark, fontSize: 16.sp),
      decoration: BoxDecoration(
          color: AppColors.mainColorDark,
          borderRadius: BorderRadius.circular(8)),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.bottomNavActiveIconColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isConfirmationVerified) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.MAIN, (route) => false);
          }
          if(state.hasError){
            snackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state1) {
              final bg = state1.isDark
                  ? 'assets/images/img_bg_night.jpg'
                  : 'assets/images/img_bg_light.jpg';
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        50.verticalSpace,
                        Image.asset(
                          'assets/images/img_logo_uz.png',
                          height: 60.h,
                        ),
                        16.verticalSpace,
                        Text(
                          S.of(context).mobilRaqamniTasdiqlash,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          S
                              .of(context)
                              .raqamingizniTekshirishUchunSmsKodYubordikIltimosQuyidagiKodniKiriting,
                          style: TextStyle(fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 22.r,
                            ),
                            4.horizontalSpace,
                            Text(
                              "60",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        20.verticalSpace,
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              S.of(context).qaytadanYuborish,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            )),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Pinput(
                                  length: 6,
                                  controller: pinController,
                                  focusNode: focusNode,
                                  showCursor: true,
                                  preFilledWidget: preFilledWidget,
                                  defaultPinTheme: defaultPinTheme,
                                  pinAnimationType: PinAnimationType.slide,
                                  androidSmsAutofillMethod:
                                      AndroidSmsAutofillMethod
                                          .smsUserConsentApi,
                                  listenForMultipleSmsOnAndroid: true,
                                  separatorBuilder: (index) =>
                                      const SizedBox(width: 8),
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  onCompleted: (pin) {
                                    debugPrint('onCompleted: $pin');
                                  },
                                  onChanged: (value) {
                                    debugPrint('onChanged: $value');
                                  },
                                  cursor: cursor),
                            ],
                          ),
                        )
                      ],
                    ),
                    state.isLoading
                        ? CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary,)
                        : AppElevatedButton(
                      text: "Davom etish",
                      onClick: () {
                        if (pinController.text.length == 6) {
                          bloc.confirmation(
                            body: ConfirmationBody(
                                code: pinController.text,
                                id: state.registerModel?.data?.id ?? 0),
                          );
                        }
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
