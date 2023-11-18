import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key, this.controller,
  });

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 42.h,
      margin: EdgeInsets.only(right: 12.w),
      child: TextFormField(
        controller: controller,
        style: AppStyles.interMedium(),
        cursorColor: AppColors.whiteColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whiteColor, width: 2.w),
            borderRadius: BorderRadius.circular(100.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whiteColor, width: 2.w),
            borderRadius: BorderRadius.circular(100.r),
          ),
          hintText: '1000',
          hintStyle: AppStyles.interMedium(color: AppColors.whiteColor),
          contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}