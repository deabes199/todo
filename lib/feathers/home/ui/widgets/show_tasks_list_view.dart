import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';
import 'package:todo_app/feathers/home/ui/widgets/task_component.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: context.read<AddTaskCubit>().taskList.length,
            itemBuilder: (context, index) {
              return TaskComponent(
                taskModel: context.read<AddTaskCubit>().taskList[index],
              
              );
            }));
  }
}
