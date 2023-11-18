import 'package:final_app/features/home/controller/home_controller.dart';
import 'package:final_app/utils/app_colors.dart';
import 'package:final_app/utils/app_strings.dart';
import 'package:final_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRadioButtons extends StatelessWidget {
  const CustomRadioButtons({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Radio(
            value: 1,
            groupValue: homeController.radioSelectedValue.value,
            activeColor: Colors.green,
            fillColor: const MaterialStatePropertyAll(Colors.white),
            onChanged: (value) {
              homeController.updateSelectedValue(value!);
            },
          ),
        ),
        Text(
          AppStrings.cmyk,
          style:
              AppStyles.interMedium(size: 20.sp, color: AppColors.whiteColor),
        ),
        SizedBox(width: 35.w),
        Obx(
          () => Radio(
            value: 2,
            groupValue: homeController.radioSelectedValue.value,
            fillColor: const MaterialStatePropertyAll(Colors.white),
            activeColor: Colors.green,
            onChanged: (value) {
              homeController.updateSelectedValue(value!);
            },
          ),
        ),
        Text(
          AppStrings.rgb,
          style: AppStyles.interMedium(size: 20.sp, color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
