import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/confirmation_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/language_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/login_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/one_id_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/recover_password_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/register_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/slider_page.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/pages/splash_page.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/pages/create_reference_page.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/pages/home_references_page.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/pages/notifications_page.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/pages/problems_page.dart';
import 'package:aloqa_nazorat/src/features/main/main_page.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/pages/about_app_page.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/pages/delete_account_page.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/pages/help_page.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/pages/personal_information_page.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/pages/settings_page.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/pages/reference_info_page.dart';
import 'package:flutter/material.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(route: AppRoutes.INITIAL, page: const SplashPage()),
      PageEntity(route: AppRoutes.SLIDER, page: const SliderPage()),
      PageEntity(route: AppRoutes.LANGUAGE, page: const LanguagePage()),
      PageEntity(route: AppRoutes.LOGIN, page: const LoginPage()),
      PageEntity(route: AppRoutes.REGISTER, page: const RegisterPage()),
      PageEntity(route: AppRoutes.CONFIRMATION, page: const ConfirmationPage()),
      PageEntity(route: AppRoutes.RECOVER_PASSWORD, page: const RecoverPasswordPage()),
      PageEntity(route: AppRoutes.MAIN, page: const MainPage()),
      PageEntity(route: AppRoutes.PROBLEMS, page: const ProblemsPage()),
      PageEntity(route: AppRoutes.REFERENCE_INFO, page: const ReferenceInfoPage()),
      PageEntity(route: AppRoutes.CREATRE_REFERENCE, page: const CreateReferencePage()),
      PageEntity(route: AppRoutes.ONE_ID, page: const OneIdPage()),
      PageEntity(route: AppRoutes.NOTIFICATIONS, page: const NotificationsPage()),
      PageEntity(route: AppRoutes.HOME_REFERENCES, page: const HomeReferencesPage()),
      PageEntity(route: AppRoutes.PERSONAL_INFORMATION, page: const PersonalInformationPage()),
      PageEntity(route: AppRoutes.SETTINGS, page: const SettingsPage()),
      PageEntity(route: AppRoutes.ABOUT_APP, page: const AboutAppPage()),
      PageEntity(route: AppRoutes.HELP, page: const HelpPage()),
      PageEntity(route: AppRoutes.DELETE_ACCOUNT, page: const DeleteAccountPage()),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {}
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
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
