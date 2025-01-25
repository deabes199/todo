import 'package:flutter/material.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/home/ui/widgets/date_picker.dart';
import 'package:todo_app/feathers/home/ui/widgets/show_tasks_list_view.dart';
import 'package:todo_app/feathers/home/ui/widgets/tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  const TabBarWidget(),
                  verticalSpace(10),
                  Text(
                    'Today',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpace(10),
                  const DatePickerWidget(),
                  verticalSpace(30),
                  const TaskListView(),
                ],
              ),
            ),
          ),
        );
      }
    
  }

