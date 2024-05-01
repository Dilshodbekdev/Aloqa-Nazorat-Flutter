import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_components.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/config/theme/text_styles.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/app_state/localization.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final cubit = context.read<AppCubit>();

  bool uzCheckboxValue = false;
  bool enCheckboxValue = false;
  bool ruCheckboxValue = false;
  bool darkCheckboxValue = false;
  bool lightCheckboxValue = false;

  /*@override
  void initState() {
    Prefs.getString(AppConstants.kLocale)
        .then((value) => _handleLocale(value ?? 'uz'));
    Prefs.getBool(AppConstants.kDark)
        .then((value) => _handleTheme(value ?? true));
    super.initState();
  }*/

  void _handleTheme(bool isDark) {
    if (isDark) {
      darkCheckboxValue = true;
      lightCheckboxValue = false;
    } else {
      lightCheckboxValue = true;
      darkCheckboxValue = false;
    }
  }

  void _handleLocale(String locale) {
    if (locale == "uz") {
      uzCheckboxValue = true;
      ruCheckboxValue = false;
      enCheckboxValue = false;
    } else if (locale == "ru") {
      uzCheckboxValue = false;
      ruCheckboxValue = true;
      enCheckboxValue = false;
    } else if (locale == "en") {
      uzCheckboxValue = false;
      ruCheckboxValue = false;
      enCheckboxValue = true;
    } else {
      uzCheckboxValue = true;
      ruCheckboxValue = false;
      enCheckboxValue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).shaxsiyMalumotlar,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bg = state.isDark
              ? 'assets/images/img_bg_night.jpg'
              : 'assets/images/img_bg_light.jpg';
          _handleTheme(state.isDark);
          _handleLocale(state.lang);

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ExpansionTile(
                    iconColor: AppColors.buttonColorDark,
                    textColor: AppColors.buttonColorDark,
                    leading: const Icon(
                      Icons.language,
                    ),
                    title: Text(
                      S.of(context).ilovaTili,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: uzCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            uzCheckboxValue = value!;
                            ruCheckboxValue = false;
                            enCheckboxValue = false;
                          });
                          cubit.changeLocale(Localization.uz, 'uz');
                        },
                        title: Text(
                          "O’zbekcha",
                          style: CustomTextStyle.h16R,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const AppDivider(),
                      ),
                      CheckboxListTile(
                        value: enCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            enCheckboxValue = value!;
                            uzCheckboxValue = false;
                            ruCheckboxValue = false;
                          });
                          cubit.changeLocale(Localization.en, 'en');
                        },
                        title: Text(
                          S.of(context).en,
                          style: CustomTextStyle.h16R,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const AppDivider(),
                      ),
                      CheckboxListTile(
                        value: ruCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            ruCheckboxValue = value!;
                            uzCheckboxValue = false;
                            enCheckboxValue = false;
                          });
                          cubit.changeLocale(Localization.ru, 'ru');
                        },
                        title: Text(
                          S.of(context).ru,
                          style: CustomTextStyle.h16R,
                        ),
                      ),
                    ],
                  ),
                ),
                12.verticalSpace,
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ExpansionTile(
                    iconColor: AppColors.buttonColorDark,
                    textColor: AppColors.buttonColorDark,
                    leading: const Icon(
                      Icons.dark_mode,
                    ),
                    title: Text(
                      S.of(context).ilovaKorinishi,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: darkCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            darkCheckboxValue = value!;
                            lightCheckboxValue = !lightCheckboxValue;
                          });
                          cubit.toDark();
                        },
                        title: Text(
                          S.of(context).tungi,
                          style: CustomTextStyle.h16R,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const AppDivider(),
                      ),
                      CheckboxListTile(
                        checkColor: AppColors.completesColor,
                        value: lightCheckboxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            lightCheckboxValue = value!;
                            darkCheckboxValue = !darkCheckboxValue;
                          });
                          cubit.toLight();
                        },
                        title: Text(
                          S.of(context).kunduzgi,
                          style: CustomTextStyle.h16R,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
