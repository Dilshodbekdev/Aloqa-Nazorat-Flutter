import 'package:aloqa_nazorat/src/config/theme/themes.dart';
import 'package:aloqa_nazorat/src/core/app_state/localization.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
          theme: darkTheme,
          locale: Localization.uz,
          isDark: true,
          lang: 'uz',
        ));

  changeTheme(ThemeData theme) => emit(state.copyWith(theme: theme));

  toDark() {
    emit(state.copyWith(theme: darkTheme, isDark: true));
    Prefs.setBool(AppConstants.kDark, true);
  }

  toLight() {
    emit(state.copyWith(
      theme: lightTheme,
      isDark: false,
    ));
    Prefs.setBool(AppConstants.kDark, false);
  }

  changeLocale(Locale locale, String lang) {
    emit(state.copyWith(
      locale: locale,
      lang: lang,
    ));
    Prefs.setString(AppConstants.kLocale, lang);
  }

  init() async {
    var isDark = await Prefs.getBool(AppConstants.kDark) ?? true;
    var lang = await Prefs.getString(AppConstants.kLocale) ?? 'uz';
    var locale = await Prefs.getString(AppConstants.kLocale);
    var localization = Localization.all.firstWhere((element) => element.languageCode == locale);
    var theme = isDark ? darkTheme : lightTheme;
    emit(state.copyWith(
        theme: theme, locale: localization, isDark: isDark, lang: lang));
  }
}
