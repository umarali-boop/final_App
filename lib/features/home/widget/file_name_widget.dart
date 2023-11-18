import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/custom_svg.dart';

class FileNameWidget extends StatelessWidget {
  const FileNameWidget({
    super.key,
    this.width,
    this.height,
    this.imageWidth,
    this.imageHeight,
    this.text,
    this.style, this.onTap,
  });

  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final String? text;
  final TextStyle? style;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 140.w,
        height: height ?? 140.h,
        decoration: BoxDecoration(
            color: AppColors.fileNameColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvg(
              image: AppAssets.tree,
              wi: imageWidth ?? 48.w,
              hi: imageHeight ?? 60.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              text ?? AppStrings.fileName,
              style: style ?? AppStyles.interRegular(size: 20.sp,color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}