import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/add_task/ui/widgets/add_task_bloc_listenr.dart';
import 'package:todo_app/feathers/add_task/ui/widgets/add_task_text_form_fields.dart';
import 'package:todo_app/feathers/add_task/ui/widgets/appBar.dart';
import 'package:todo_app/feathers/add_task/ui/widgets/change_color.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addTaskAppBar(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              children: [
                const TextFormFildesAddTask(),
                verticalSpace(20),
                const ChangeColors(),
                verticalSpace(90),
               const AddTaskBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

