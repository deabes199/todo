import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';

AppBar addTaskAppBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    ),
    title: Text(
      AppStrings.addTask,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30),
    ),
  );
}
