import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/core/widgets/app_custom_button.dart';
import 'package:todo_app/core/widgets/app_text_form_field.dart';
import 'package:todo_app/core/widgets/flutter_toast.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

class TextFormFildesAddTask extends StatefulWidget {
  const TextFormFildesAddTask({super.key});

  @override
  State<TextFormFildesAddTask> createState() => _TextFormFildesAddTaskState();
}

class _TextFormFildesAddTaskState extends State<TextFormFildesAddTask> {
  @override
  Widget build(BuildContext context) {
    var addCubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccessState) {
          showToast(msg: 'Added Successfuly', state: ToastState.success);
          Navigator.pushNamed(context, Routes.homeScreen);
        }
      },
      builder: (context, state) {
        return Form(
          key: addCubit.globalKey,
          child: Column(
            children: [
              AppTextFormFiled(
                title: AppStrings.tilte,
                controller: addCubit.titleController,
                hint: AppStrings.tilteHint,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.tilteErrorMsg;
                  }
                  return null;
                },
              ),
              verticalSpace(26),
              AppTextFormFiled(
                title: AppStrings.note,
                controller: addCubit.noteController,
                hint: AppStrings.notehint,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.noteErrorMsg;
                  }
                  return null;
                },
              ),
              verticalSpace(16),
              AppTextFormFiled(
                readOnly: true,
                title: AppStrings.date,
                controller: addCubit.dateController,
                hint: DateFormat.yMd().format(addCubit.currentDate),
                suffixIcon: IconButton(
                    onPressed: () {
                      addCubit.getDateTime(context);
                    },
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                    )),
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormFiled(
                      title: AppStrings.startTime,
                      hint: addCubit.startTime,
                      suffixIcon: IconButton(
                        onPressed: () {
                          addCubit.getStartTime(context);
                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                        ),
                      ),
                    ),
                  ),
                  horzintalSpace(24),
                  Expanded(
                    child: AppTextFormFiled(
                      title: AppStrings.endTime,
                      hint: addCubit.endTime,
                      suffixIcon: IconButton(
                        onPressed: () {
                          addCubit.getEndTime(context);
                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpace(90),
              AppTextButton(
                onpressed: () {
                  if (addCubit.globalKey.currentState!.validate()) {
                    addCubit.addTask();
                  }
                },
                buttonText: AppStrings.createTask,
                backgroundcolor: AppColors.primary,
              )
            ],
          ),
        );
      },
    );
  }
}
