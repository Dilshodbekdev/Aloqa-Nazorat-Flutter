import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/language/language_page.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/login/login_page.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/register/register_page.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/slider/slider_page.dart';
import 'package:aloqa_nazorat/src/features/presentation/auth/splash/splash_page.dart';
import 'package:aloqa_nazorat/src/features/presentation/main/main_page.dart';
import 'package:flutter/material.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(route: AppRoutes.INITIAL, page: const SplashPage()),
      PageEntity(route: AppRoutes.SLIDER, page: const SliderPage()),
      PageEntity(route: AppRoutes.LANGUAGE, page: const LanguagePage()),
      PageEntity(route: AppRoutes.LOGIN, page: const LoginPage()),
      PageEntity(route: AppRoutes.REGISTER, page: const RegisterPage()),
      PageEntity(route: AppRoutes.MAIN, page: const MainPage()),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {}
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => const SplashPage(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page});
}
