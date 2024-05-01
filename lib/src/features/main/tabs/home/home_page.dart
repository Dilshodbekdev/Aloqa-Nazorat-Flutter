import 'dart:convert';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:aloqa_nazorat/src/features/main/tabs/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.init();
    //bloc.getNotifications();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          content: Text(
            S.of(context).hurmatliFoydalanuvchiIltimosTizimgaQaytadanKiring,
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  )),
              child: Text(S.of(context).ha,style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
                Prefs.setString(AppConstants.kToken, '');
                Prefs.setString(AppConstants.kUser, '');
                Prefs.setBool(AppConstants.kExit, true);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.INITIAL, (route) => false);
              },
            ),
          ],
        );
      },
    );
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
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.isExit) {
            _showMyDialog();
          }
          if(state.hasError){
            _showMyDialog();
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state1) {
              final bg = state1.isDark
                  ? 'assets/images/img_bg_night.jpg'
                  : 'assets/images/img_bg_light.jpg';
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 30.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.h),
                                  bottomRight: Radius.circular(15.h)),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/img_home.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 240.w,
                              height: 60.h,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    HomeCircularWidget(
                                      icon: 'assets/icons/ic_download.svg',
                                      color: AppColors.sentColor,
                                      count: state.sendReferenceCount,
                                      onClick: () {
                                        Navigator.of(context).pushNamed(
                                          AppRoutes.HOME_REFERENCES,
                                          arguments: 1,
                                        );
                                      },
                                    ),
                                    HomeCircularWidget(
                                      icon: 'assets/icons/ic_upload.svg',
                                      color: AppColors.completesColor,
                                      count: state.responseReferenceCount,
                                      onClick: () {
                                        Navigator.of(context).pushNamed(
                                          AppRoutes.HOME_REFERENCES,
                                          arguments: 2,
                                        );
                                      },
                                    ),
                                    HomeCircularWidget(
                                      icon: 'assets/icons/ic_category.svg',
                                      color: AppColors.progressColor,
                                      count: state.allReferenceCount,
                                      onClick: () {
                                        Navigator.of(context).pushNamed(
                                          AppRoutes.HOME_REFERENCES,
                                          arguments: 3,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 50.h,
                              left: 16.w,
                              right: 16.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).assalomuAleykum,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp),
                                      ),
                                      FutureBuilder(
                                        future:
                                            Prefs.getString(AppConstants.kUser),
                                        builder: (context, snapshot) {
                                          UserData? userData;
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.data != null) {
                                            userData = UserData.fromJson(
                                                jsonDecode(snapshot.data!));
                                          }
                                          return Text(
                                            "${userData?.firstName} ${userData?.lastName}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.NOTIFICATIONS);
                                    },
                                    child: SizedBox(
                                      width: 26.h,
                                      height: 26.h,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Icon(
                                              Icons.notifications,
                                              size: 24.h,
                                              color: Colors.white,
                                            ),
                                          ),
                                          if (state.notificationCount > 0)
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: 12.h,
                                                width: 12.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.h)),
                                                child: Center(
                                                    child: Text(
                                                  state.notificationCount
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                )),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        S.of(context).muammoingizgaTegishliBolimniTanlang,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            (state.isLoading)
                                ? CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary,)
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount: state.references?.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                bloc.getReferenceChildren(state
                                                        .references?[index]
                                                        .id ??
                                                    9);
                                                Navigator.pushNamed(
                                                    context, AppRoutes.PROBLEMS,
                                                    arguments: state
                                                        .references?[index]);
                                              },
                                              child: Card(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 6.w,
                                                  vertical: 8.h,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.h),
                                                ),
                                                color:
                                                    AppColors.bottomLineColor,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 1.h),
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 32,
                                                        child: SvgPicture.asset(
                                                          'assets/icons/ic_${state.references?[index].id}.svg',
                                                          color: Theme.of(context).textTheme.bodyLarge?.color,
                                                        ),
                                                      ),
                                                      4.verticalSpace,
                                                      Text(
                                                        textLocale(state.references?[index]
                                                            .name, state1.lang),
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                            8.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                _makePhoneCall('1144');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 80.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.h),
                                    border: Border.all(
                                        color: AppColors.bottomLineColor,
                                        width: 1.h)),
                                child: Center(
                                    child: Text(
                                  S.of(context).callCenter1111,
                                  style: TextStyle(fontSize: 18.sp),
                                      textAlign: TextAlign.center,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
