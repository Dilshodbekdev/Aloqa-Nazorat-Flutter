import 'dart:convert';
import 'dart:io';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_components.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/manager/profile_bloc.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/widgets/profile_exit_widgets.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final passwordCon = TextEditingController();
  final passwordConfirmCon = TextEditingController();
  UserData? userData;

  late final bloc = context.read<ProfileBloc>();

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          content: Text(
            S.of(context).haqiqatdanChiqishniXohlaysizmi,
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.buttonColorDark),
              child: Text(
                S.of(context).yoq,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.buttonColorDark),
              child: Text(
                S.of(context).ha,
                style: const TextStyle(color: Colors.white),
              ),
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

  Future<void> _showSelectImageDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor: AppColors.mainColorDark,
            content: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
                IconButton(onPressed: () {}, icon: Icon(Icons.photo)),
              ],
            ));
      },
    );
  }

  Future<void> _showChangePasswordDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          title: Text(
            S.of(context).parolniTiklash,
            style: TextStyle(fontSize: 16.sp),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 116.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: TextField(
                    onChanged: (value) {},
                    controller: passwordCon,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: S.of(context).password,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: TextField(
                    onChanged: (value) {},
                    controller: passwordConfirmCon,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: S.of(context).parolniTasdiqlang,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.buttonColorDark),
              child: Text(S.of(context).ozgartirish),
              onPressed: () {
                if (passwordCon.text.isNotEmpty &&
                    passwordConfirmCon.text.isNotEmpty) {
                  if (passwordCon.text == passwordConfirmCon.text) {
                    bloc.changePassword(
                        body: ChangePasswordBody(
                      password: passwordCon.text,
                      firstName: userData?.firstName,
                      lastName: userData?.lastName,
                    ));
                    Navigator.of(context).pop();
                    passwordCon.text = "";
                    passwordConfirmCon.text = "";
                  } else {
                    snackBar(S.of(context).parolniTasdiqlashdaXatolikBor);
                  }
                } else {
                  snackBar(S.of(context).barchaMaydonlarniToldiring);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).shaxsiyKabinet,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(onPressed: (){
            _showMyDialog();
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder(
        future: Prefs.getString(AppConstants.kUser),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
            userData = UserData.fromJson(jsonDecode(snapshot.data!));
          }
          return BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state.isLoginVerified) {
                snackBar(S.of(context).parolMuvoffaqiyatliOzgartirildi);
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
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    borderRadius: BorderRadius.circular(8.h)),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26.r,
                                      backgroundImage: NetworkImage(
                                          "https://xn.technocorp.uz/storage/${userData?.photo}"),
                                    ),
                                    12.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${userData?.firstName} ${userData?.lastName}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        8.verticalSpace,
                                        if (userData?.phone != null)
                                          Text(
                                            "+998 ${userData?.phone}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp),
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              16.verticalSpace,
                              const AppDivider(),
                              ProfileButtonWidget(
                                icon: Icons.person,
                                text: S.of(context).shaxsiyMalumotlar,
                                onClick: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.PERSONAL_INFORMATION);
                                },
                              ),
                              ProfileButtonWidget(
                                icon: Icons.list_alt_outlined,
                                text: S.of(context).foydalanishQollanmasi,
                                onClick: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.SLIDER,
                                    arguments: 2,
                                  );
                                },
                              ),
                              ProfileButtonWidget(
                                icon: Icons.settings,
                                text: S.of(context).sozlamalar,
                                onClick: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.SETTINGS);
                                },
                              ),
                              ProfileButtonWidget(
                                icon: Icons.info,
                                text: S.of(context).ilovaHaqida,
                                onClick: () {
                                  _openPDFFromAssets(textPDFPath(state1.lang));
                                  /*Navigator.of(context).pushNamed(
                                    AppRoutes.ABOUT_APP,
                                    arguments: textPDFPath(state1.lang),);*/
                                },
                              ),
                              ProfileButtonWidget(
                                icon: Icons.share,
                                text: S.of(context).ulashish,
                                onClick: () {},
                              ),
                              ProfileButtonWidget(
                                icon: Icons.support_agent,
                                text: S.of(context).yordam,
                                onClick: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.HELP);
                                },
                              ),
                              ProfileButtonWidget(
                                icon: Icons.lock_open,
                                text: S.of(context).parolniTiklash,
                                onClick: () {
                                  _showChangePasswordDialog();
                                },
                              ),
                              ProfileExitButtonWidget(
                                icon: CupertinoIcons.delete,
                                text: S.of(context).hisobniOchirish,
                                onClick: () {
                                  Navigator.of(context).pushNamed(AppRoutes.DELETE_ACCOUNT);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _openPDFFromAssets(String path) async {
    try {
      // Load the PDF asset as a byte list
      ByteData data = await rootBundle.load(path);
      List<int> bytes = data.buffer.asUint8List();

      // Open the PDF using the open_file package
      final tempFile =
          File('${(await getTemporaryDirectory()).path}/${S.of(context).ilovaHaqida}.pdf');
      await tempFile.writeAsBytes(bytes);
      await OpenFile.open(tempFile.path);
    } catch (e) {
      print('Error opening PDF: $e');
    }
  }
}
