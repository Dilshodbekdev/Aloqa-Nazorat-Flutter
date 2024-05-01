import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/routes/pages.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/locator.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/manager/profile_bloc.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/manager/reference_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AppCubit>()..init()),
          BlocProvider(create: (context) => locator<AuthBloc>()),
          BlocProvider(create: (context) => locator<HomeBloc>()),
          BlocProvider(create: (context) => locator<ReferenceBloc>()),
          BlocProvider(create: (context) => locator<ProfileBloc>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ScreenUtilInit(
              builder: (context, child) => MaterialApp(
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: state.theme,
                onGenerateRoute: AppPages.generateRouteSettings,
              ),
            );
          },
        ));
  }
}
