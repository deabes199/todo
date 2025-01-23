  import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        verticalSpace(10),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.noTaskTitle,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 24),
          ),
        ),
        verticalSpace(10),
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
