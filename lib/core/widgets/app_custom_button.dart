import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? buttonHieght;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final VoidCallback onpressed;
  final String buttonText;

  final Color? backgroundcolor;
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.buttonHieght,
      this.buttonWidth,
      this.horizontalPadding,
      this.verticalPadding,
      required this.onpressed,
      required this.buttonText,
      this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0.r))),
          backgroundColor:
              WidgetStateProperty.all(backgroundcolor ?? AppColors.primary),
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 12.h)),
          fixedSize: WidgetStateProperty.all(
            Size(double.maxFinite, 50.w),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.white),
        ));
  }
}
