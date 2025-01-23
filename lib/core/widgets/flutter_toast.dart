import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/core/utils/app_colors.dart';

void showToast({
  required String msg,
 required ToastState state
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { error, success, warining }

Color getState(ToastState state) {
  switch (state) {
    case ToastState.success:
      return AppColors.primary;
    case ToastState.error:
      return AppColors.red;
    case ToastState.warining:
      return AppColors.orange;

    default:
      return AppColors.primary;
  }
}
