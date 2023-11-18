import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/button_with_icon.dart';
import '../widget/file_name_widget.dart';
import 'edit_clipboard_dialog.dart';

class ClipBoardDetail extends StatelessWidget {
  const ClipBoardDetail({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 378.w,
        height: 456.h,
        decoration: BoxDecoration(
            color: AppColors.fillColor,
            borderRadius: BorderRadius.circular(48.r)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FileNameWidget(
                      onTap: () {
                          editClipBoardDialog(context);
                      },
                    ),
                    const FileNameWidget(),
                  ],
                ),
              ),
              const FileNameWidget(),
              SizedBox(height: 32.h,),
              ButtonWithIcon(
                text: AppStrings.importImage,
                color: AppColors.lightBlueColor,
              ),
            ],
          ),
        ));
  }
}