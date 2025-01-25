part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

/// date time
final class AddTaskInitial extends AddTaskState {}

final class GetDateSuccessState extends AddTaskState {}

final class GetDateErrorState extends AddTaskState {
  final String error;

  GetDateErrorState({required this.error});
}

///// start time

final class GetStartTimeSuccessState extends AddTaskState {}

final class GetStartTimeErrorState extends AddTaskState {
  final String error;

  GetStartTimeErrorState({required this.error});
}

//// end time

final class GetEndTimeSuccessState extends AddTaskState {}

final class GetEndTimeErrorState extends AddTaskState {
  final String error;

  GetEndTimeErrorState({required this.error});
}

/// change color
final class ChangeColorState extends AddTaskState {}

// add task
final class AddTaskLoadingState extends AddTaskState {}

final class AddTaskSuccessState extends AddTaskState {}

final class AddTaskErrorState extends AddTaskState {
  final String error;

  AddTaskErrorState({required this.error});
}

//// get Task
final class GetTaskLoadingState extends AddTaskState {}

final class GetTaskSuccessState extends AddTaskState {}

final class GetTaskErrorState extends AddTaskState {
  final String error;

  GetTaskErrorState({required this.error});
}

/// update tasks
final class UpdateTaskLoadingState extends AddTaskState {}

final class UpdateTaskSuccessState extends AddTaskState {}

final class UpdateTaskErrorState extends AddTaskState {
    final String error;

  UpdateTaskErrorState({required this.error});
}

/// delete task

final class DeleteTaskSuccessState extends AddTaskState {}

final class DeleteTaskErrorState extends AddTaskState {
     final String error;

  DeleteTaskErrorState({required this.error});
}

///  select date
final class SelectedDateSuccessState extends AddTaskState {}

final class SelectedDateLoadingState extends AddTaskState {}
