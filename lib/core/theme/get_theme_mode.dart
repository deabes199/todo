import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';

ThemeData getDarkThemeMode() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(AppColors.white)),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.white.withOpacity(.87),
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white.withOpacity(.87),
      ),
      displaySmall: TextStyle(
        color: AppColors.white.withOpacity(.44),
        fontSize: 16.sp,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBlack,
      hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.white),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(8.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(8.r)),
    ),
  );
}

ThemeData getThemeMode() {
  return ThemeData(
     brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style:
          ButtonStyle(iconColor: WidgetStatePropertyAll(AppColors.background)),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        color: AppColors.background.withOpacity(.87),
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: AppColors.white.withOpacity(.87),
      ),
      displaySmall: TextStyle(
        color: AppColors.background.withOpacity(.44),
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.background,
      filled: true,
      fillColor: AppColors.grey.withOpacity(.10),
      hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.background),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r)),
    ),
  );
}
