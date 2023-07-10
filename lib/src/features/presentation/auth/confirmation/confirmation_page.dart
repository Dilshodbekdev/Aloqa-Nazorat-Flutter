import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img_bg_night.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                    height: 100.h,
                    child: SvgPicture.asset('assets/icons/ic_logo_uz.svg'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
