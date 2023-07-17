import 'package:aloqa_nazorat/src/core/app_state/localization.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(theme: ThemeData.light(), locale: Localization.uz));
}
