part of 'app_cubit.dart';

class AppState {
  final ThemeData theme;
  final Locale locale;

  AppState({required this.theme, required this.locale});

  AppState copyWith({ThemeData? theme, Locale? locale}) {
    return AppState(theme: theme ?? this.theme, locale: locale ?? this.locale);
  }
}
