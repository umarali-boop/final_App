import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/button_with_icon.dart';
import '../../../widgets/cancel_button.dart';
import '../controller/home_controller.dart';
import 'package:get/get.dart';
import '../widget/file_name_widget.dart';
import '../widget/slider_option_widget.dart';

class PatternMakerDetail extends StatelessWidget {
  const PatternMakerDetail({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339.w,
      height: 609.h,
      decoration: BoxDecoration(
          color: AppColors.fillColor,
          borderRadius: BorderRadius.circular(48.r)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: FileNameWidget(
                width: 210.w,
                height: 201.h,
                imageWidth: 72.w,
                imageHeight: 90.h,
                text: AppStrings.imagePreview,
                style: AppStyles.interMedium(size: 20.sp),
              ),
            ),
            Obx(
              () => SliderOptionWidget(
                maxValue: homeController.maxValue1.value,
                value: homeController.sliderValue1.value,
                onChange: (value) {
                  homeController.sliderValue1.value = value;
                },
                textValue: "${homeController.sliderValue1.value.toInt()}",
              ),
            ),
            Obx(
              () => SliderOptionWidget(
                maxValue: homeController.maxValue2.value,
                value: homeController.sliderValue2.value,
                onChange: (value) {
                  homeController.sliderValue2.value = value;
                },
                textValue: "${homeController.sliderValue2.value.toInt()}",
              ),
            ),
            Obx(
              () => SliderOptionWidget(
                maxValue: homeController.maxValue3.value,
                value: homeController.sliderValue3.value,
                onChange: (value) {
                  homeController.sliderValue3.value = value;
                },
                textValue: "${homeController.sliderValue3.value.toInt()}",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CancelButton(
                  color: Colors.transparent,
                ),
                ButtonWithIcon(
                  width: 160.w,
                  bottomHeight: 0.h,
                  text: AppStrings.add,
                  color: AppColors.lightBlueColor,
                ),
              ],
            ),
            Get.context!.isPhone && Get.context!.isLandscape
                ? const SizedBox(height: 150)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
