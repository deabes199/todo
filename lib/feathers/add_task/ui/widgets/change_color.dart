import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

class ChangeColors extends StatefulWidget {
  const ChangeColors({super.key});

  @override
  State<ChangeColors> createState() => _ChangeColorsState();
}

class _ChangeColorsState extends State<ChangeColors> {
  @override
  Widget build(BuildContext context) {
    var addCubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return SizedBox(
          height: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.color,
                style: Theme.of(context).textTheme.displaySmall!,
              ),
              verticalSpace(10),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const Padding(padding: EdgeInsets.only(right: 8)),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        addCubit.changeColor(index);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: addCubit.getColor(index),
                        child: index == addCubit.currntIndex
                            ? const Icon(
                                Icons.check,
                                color: AppColors.white,
                              )
                            : null,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
