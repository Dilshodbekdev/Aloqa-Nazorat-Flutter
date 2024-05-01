import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  var _index = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: args == 2
          ? AppBar(
              title: Text(
                S.of(context).foydalanishQollanmasi,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            )
          : null,
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bg = state.isDark
              ? 'assets/images/img_auth_bg_night.png'
              : 'assets/images/img_auth_bg_light.png';
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(bg), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 380.h,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        _index = value;
                      });
                    },
                    children: [
                      _itemSlider(
                          'assets/icons/ic_intro_1.svg',
                          S.of(context).intro_title_1,
                          S.of(context).intro_desc_1),
                      _itemSlider(
                          'assets/icons/ic_intro_2.svg',
                          S.of(context).intro_title_2,
                          S.of(context).intro_desc_2),
                      _itemSlider(
                          'assets/icons/ic_intro_3.svg',
                          S.of(context).intro_title_3,
                          S.of(context).intro_desc_3),
                      _itemSlider(
                          'assets/icons/ic_intro_4.svg',
                          S.of(context).intro_title_4,
                          S.of(context).intro_desc_4),
                    ],
                  ),
                ),
                DotsIndicator(
                  decorator: DotsDecorator(
                    activeColor: AppColors.bottomNavActiveIconColor,
                    color: AppColors.bottomNavNoActiveIconColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  dotsCount: 4,
                  position: _index,
                ),
                32.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 32.h),
                  child:AppElevatedButton(text: S.of(context).next, onClick: (){
                    if (_index != 3) {
                      setState(() {
                        _index++;
                        controller.animateToPage(_index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      });
                    } else {
                      args == 1
                          ? Navigator.of(context)
                          .pushNamed(AppRoutes.LANGUAGE)
                          : Navigator.pop(context);
                    }
                  })
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _itemSlider(String img, String title, String desc) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(32.h),
          decoration: BoxDecoration(
              color: AppColors.sliderImageColorDark,
              borderRadius: BorderRadius.circular(16.h)),
          child: SvgPicture.asset(
            img,
            height: 100.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            desc,
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
