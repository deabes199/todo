import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theme/cubit/theme_cubit.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/spacer.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      required this.title,
      this.controller,
      required this.hint,
      this.readOnly = false,
      this.suffixIcon,
      this.validator});
  final String title;
  final TextEditingController? controller;
  final String hint;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.white),
        ),
        verticalSpace(10),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(
            color: context.read<ThemeCubit>().isDark
                ? Colors.black
                : AppColors.white,
          ),
          showCursor: false,
          readOnly: readOnly,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
