import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'tabs/home/home_page.dart';
import 'tabs/profile/profile_page.dart';
import 'tabs/references/references_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[HomePage(),ReferencesPage(),ProfilePage()];
  var index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            index=value;
          });
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColorDark,
        iconSize: 24,
          selectedItemColor: AppColors.bottomNavActiveIconColor,
          unselectedItemColor: AppColors.bottomNavNoActiveIconColor,
          items: [
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/ic_home.svg'),label: S.of(context).main),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/ic_reference.svg'),label: S.of(context).references),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/ic_profile.svg'),label: S.of(context).profile),
      ]),
    );
  }
}
