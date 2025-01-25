import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/widgets/app_custom_button.dart';
import 'package:todo_app/core/widgets/flutter_toast.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

class AddTaskBlocListener extends StatelessWidget {
  const AddTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccessState) {
          showToast(msg: 'Add Succssfully', state: ToastState.success);
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
        } else if (state is AddTaskErrorState) {
          showToast(msg: state.error, state: ToastState.error);
        }
      },
      child: AppTextButton(
        onpressed: () {
          if (context.read<AddTaskCubit>().globalKey.currentState!.validate()) {
            context.read<AddTaskCubit>().addTask();
          }
        },
        buttonText: AppStrings.createTask,
        backgroundcolor: AppColors.primary,
      ),
    );
  }
}
