import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).yordam,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bg = state.isDark
              ? 'assets/images/img_bg_night.jpg'
              : 'assets/images/img_bg_light.jpg';
          return Container(
            padding: EdgeInsets.all(16.h),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ListTile(
                    onTap: () {
                      _makePhoneCall("55-501-43-17");
                    },
                    leading: const Icon(Icons.phone_in_talk),
                    title: Text(
                      S.of(context).qollabquvvatlashTelefoni,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                16.verticalSpace,
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ListTile(
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse("https://t.me/+mImBcsR0i0MzOWEy"));
                    },
                    leading: const Icon(Icons.telegram),
                    title: Text(
                      S.of(context).telegramOrqaliMurojaat,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
