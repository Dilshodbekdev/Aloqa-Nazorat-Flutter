import 'package:aloqa_nazorat/src/config/components/app_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileExitButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClick;

  const ProfileExitButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onClick(),
          title: Text(
            text,
            style: TextStyle(fontSize: 16.sp,color: Colors.red),
          ),
          leading: Icon(
            icon,
            color: Colors.red,
          ),
        ),
        const AppDivider()
      ],
    );
  }
}
