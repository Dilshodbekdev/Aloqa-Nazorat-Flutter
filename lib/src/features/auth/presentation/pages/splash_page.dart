import 'dart:async';

import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      final String token = await Prefs.getString(AppConstants.kToken) ?? "";
      if (token.isNotEmpty) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.MAIN, (route) => false);
      } else {
        final bool isExit = await Prefs.getBool(AppConstants.kExit) ?? false;
        if (isExit) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.SLIDER,
            (route) => false,
            arguments: 1,
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gif.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        /*Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).uz_com,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.textColorDark,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/img_logo_uz.png', height: 217.h),
            Text(
              textAlign: TextAlign.center,
              S.of(context).uz_com,
              style: TextStyle(
                  color: AppColors.textColorDark,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )*/
      ]),
    );
  }
}
