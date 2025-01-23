import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/theme/cubit/theme_cubit.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';
import 'package:todo_app/feathers/home/ui/widgets/empty_task.dart';
import 'package:todo_app/feathers/home/ui/widgets/show_tasks_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var addCubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: () {
              Navigator.pushNamed(context, Routes.addTaskScreen);
            },
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(
                          DateTime.now(),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 30),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            context.read<ThemeCubit>().changeTheme();
                          },
                          icon: Icon(context.read<ThemeCubit>().isDark
                              ? Icons.light_mode
                              : Icons.dark_mode))
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    'Today',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpace(10),
                  DatePicker(
                    height: 100,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    selectedTextColor: AppColors.white,
                    monthTextStyle:
                        Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)
                            : Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.black),
                    dateTextStyle:
                        Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)
                            : Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.black),
                    dayTextStyle:
                        Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)
                            : Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.black),
                    onDateChange: (date) {
                      BlocProvider.of<AddTaskCubit>(context)
                          .selectNewDate(date);
                    },
                  ),
                  verticalSpace(30),
                  addCubit.taskList.isEmpty
                      ? const EmptyTask()
                      : TaskListView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
