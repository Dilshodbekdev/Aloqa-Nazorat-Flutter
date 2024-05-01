import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/components/text_field_components.dart';
import 'package:aloqa_nazorat/src/config/routes/routes.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/manager/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SingingCharacter { text1, text2, text3 }

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  SingingCharacter? _character = SingingCharacter.text1;

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
    late final bloc = context.read<ProfileBloc>();
    String question = "";

    final textCon = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).hisobniOchirish,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.isAccountDeleted) {
            snackBar(state.deleteAccountModel?.message);
            Prefs.setString(AppConstants.kToken, '');
            Prefs.setString(AppConstants.kUser, '');
            Prefs.setBool(AppConstants.kExit, true);
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.INITIAL, (route) => false);
          }
          if (state.hasError) {
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
                  padding: EdgeInsets.all(16.h),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.info,
                                  color: Colors.red,
                                ),
                                Text(
                                  S
                                      .of(context)
                                      .foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        8.verticalSpace,
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  S
                                      .of(context)
                                      .foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi,
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ),
                              RadioListTile<SingingCharacter>(
                                title: Text(
                                  S
                                      .of(context)
                                      .mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                value: SingingCharacter.text1,
                                activeColor: AppColors.buttonColorDark,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              RadioListTile<SingingCharacter>(
                                title: Text(
                                  S
                                      .of(context)
                                      .ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                value: SingingCharacter.text2,
                                groupValue: _character,
                                activeColor: AppColors.buttonColorDark,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              RadioListTile<SingingCharacter>(
                                title: Text(
                                  S.of(context).boshqaMasalalar,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                value: SingingCharacter.text3,
                                groupValue: _character,
                                activeColor: AppColors.buttonColorDark,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100.h,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    cursorColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    maxLines: 1000,
                                    controller: textCon,
                                    style: TextStyle(fontSize: 16.sp),
                                    decoration: InputDecoration(
                                      hintText:
                                          S.of(context).qoshimchaIzohQoldirish,
                                      hintStyle: TextStyle(fontSize: 14.sp),
                                      contentPadding: EdgeInsets.all(12.r),
                                      isCollapsed: true,
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      errorStyle: TextStyle(height: 0.h),
                                      border: appTextFiledBorder(context),
                                      enabledBorder:
                                          appTextFiledBorder(context),
                                      disabledBorder:
                                          appTextFiledBorder(context),
                                      focusedBorder:
                                          appTextFiledBorder(context),
                                      errorBorder: appTextFiledErrorBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.verticalSpace,
                        state.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.tertiary,
                              ))
                            : AppElevatedButton(
                                text: S.of(context).hisobniOchirish,
                                onClick: () {
                                  bloc.deleteAccount();
                                }),
                        16.verticalSpace
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
