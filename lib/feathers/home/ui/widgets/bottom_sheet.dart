import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/core/widgets/app_custom_button.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';
import 'package:todo_app/feathers/home/data/model/task_model.dart';

showBottomSheetTask(BuildContext context, TaskModel model, AddTaskCubit cubit) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 250,
                decoration: const BoxDecoration(
                  color: AppColors.deepGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    model.isCompelet == 1
                        ? const SizedBox.shrink()
                        : AppTextButton(
                            buttonText: AppStrings.taskCompleted,
                            onpressed: () {
                              cubit.updateTask(model.id!);
                                Navigator.pop(context);
                             
                            },
                          ),
                    verticalSpace(24),
                    AppTextButton(
                      backgroundcolor: AppColors.red.withOpacity(.87),
                      buttonText: AppStrings.deleteTask,
                      onpressed: () {
                        cubit.deleteTask(model.id!);
                        Navigator.pop(context);
                      },
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: AppStrings.cancel,
                      onpressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      });
}
