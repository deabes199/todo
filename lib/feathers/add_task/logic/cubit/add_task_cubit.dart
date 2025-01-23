import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/database/sqflite_helper.dart';
import 'package:todo_app/core/di/dependancy_injextion.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/feathers/home/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey();
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now());
  int currntIndex = 0;
  List<TaskModel> taskList = [];
  void getDateTime(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSuccessState());
    } else {
      print('null');
      emit(GetDateErrorState());
    }
  }

  void selectNewDate(DateTime date) {
    emit(SelectedDateLoadingState());
    selectedDate = date;
    emit(SelectedDateSuccessState());
    getTask();
  }

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(GetStartTimeSuccessState());
    } else {
      print('start null');
      emit(GetStartTimeErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? pickedEndTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          DateTime.now(),
        ));
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      print('endTime null');
      emit(GetEndTimeErrorState());
    }
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.purple;
      case 3:
        return AppColors.deepGrey;
      case 4:
        return AppColors.primary;
      case 5:
        return AppColors.orange;
      default:
        return AppColors.grey;
    }
  }

  void changeColor(index) {
    currntIndex = index;
    emit(ChangeColorState());
  }

  void addTask() async {
    emit(AddTaskLoadingState());
    try {
      TaskModel addTask = TaskModel(
        title: titleController.text,
        body: noteController.text,
        startTime: startTime,
        endTime: endTime,
        color: currntIndex,
        isCompelet: 0,
        date: DateFormat.yMd().format(currentDate),
      );
      await getIt<SqfliteHelper>().insertIntoDb(addTask);

      titleController.clear();
      noteController.clear();
      
      emit(AddTaskSuccessState());
      getTask();
    } catch (e) {
      emit(AddTaskErrorState());
    }
  }

  void getTask() async {
    emit(GetTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().getFromDb().then((value) {
        taskList = value
            .map((element) => TaskModel.fromjson(element))
            .toList()
            .where((element) =>
                element.date == DateFormat.yMd().format(selectedDate))
            .toList();
      });
      emit(GetTaskSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDateErrorState());
    }
  }

  void updateTask(int id) async {
    emit(UpdateTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().updatedDb(id);
      emit(UpdateTaskSuccessState());
      getTask();
    } catch (e) {
      print(e.toString());
      emit(UpdateTaskErrorState());
    }
  }

  void deleteTask(int id) async {
    try {
      await getIt<SqfliteHelper>().deleteFromDb(id);
      emit(DeleteTaskSuccessState());
      getTask();
    } catch (e) {
      print(e.toString());
      emit(DeleteTaskErrorState());
    }
  }
}
