import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return DatePicker(
          height: 100,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primary,
          selectedTextColor: AppColors.white,
          monthTextStyle: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white)
              : Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
          dateTextStyle: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white)
              : Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
          dayTextStyle: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white)
              : Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
          onDateChange: (date) {
            context.read<AddTaskCubit>().selectNewDate(date);
           
          },
        );
      },
    );
  }
}
