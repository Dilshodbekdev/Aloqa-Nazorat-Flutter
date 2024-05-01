import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlineInputBorder appTextFiledBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.r),
    ),
    borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
  );
}

OutlineInputBorder appTextFiledErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.r),
    ),
    borderSide: const BorderSide(color: Colors.red),
  );
}

OutlineInputBorder appTextFiledTransparentBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.r),
    ),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}

