import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';
import 'package:todo_app/feathers/home/data/model/task_model.dart';
import 'package:todo_app/feathers/home/ui/widgets/bottom_sheet.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
  
    var addcubit = context.read<AddTaskCubit>();
    return InkWell(
      onTap: () {
        showBottomSheetTask(
          context,
          taskModel,
          addcubit
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              addcubit.getColor(taskModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                verticalSpace(16),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: AppColors.white,
                    ),
                    horzintalSpace(10),
                    Text(
                      '${taskModel.startTime} - ${taskModel.endTime}',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                verticalSpace(20),
                Text(
                  taskModel.body,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 24, color: AppColors.white),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 1,
              color: AppColors.white,
            ),
            horzintalSpace(12),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompelet == 1
                    ? AppStrings.completed
                    : AppStrings.toDo,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
