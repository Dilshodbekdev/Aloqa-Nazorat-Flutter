import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCircularWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final int count;
  final VoidCallback onClick;

  const HomeCircularWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.count,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () => onClick(),
        child: Container(
          height: 40.h,
          width: 40.h,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: SizedBox(height: 16.h, child: SvgPicture.asset(icon)),
        ),
      ),
      if (count > 0)
        Positioned(
          right: 0,
          child: Container(
            height: 14.w,
            width: 14.w,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8.r)),
            child: Center(
                child: Text(
              count.toString(),
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            )),
          ),
        )
    ]);

  }
}
