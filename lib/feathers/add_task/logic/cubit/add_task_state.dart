part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}
/// date time
final class AddTaskInitial extends AddTaskState {}
final class GetDateLoadingState extends AddTaskState {}
final class GetDateSuccessState extends AddTaskState {}
final class GetDateErrorState extends AddTaskState {}
///// start time
final class GetStartTimeLoadingState extends AddTaskState {}
final class GetStartTimeSuccessState extends AddTaskState {}
final class GetStartTimeErrorState extends AddTaskState {}
//// end time
final class GetEndTimeLoadingState extends AddTaskState {}
final class GetEndTimeSuccessState extends AddTaskState {}
final class GetEndTimeErrorState extends AddTaskState {}
/// change color
final class ChangeColorState extends AddTaskState {}
// add task
final class AddTaskLoadingState extends AddTaskState {}
final class AddTaskSuccessState extends AddTaskState {}
final class AddTaskErrorState extends AddTaskState {}
//// get Task
final class GetTaskLoadingState extends AddTaskState {}
final class GetTaskSuccessState extends AddTaskState {}
final class GetTaskErrorState extends AddTaskState {}
/// update tasks
final class UpdateTaskLoadingState extends AddTaskState {}
final class UpdateTaskSuccessState extends AddTaskState {}
final class UpdateTaskErrorState extends AddTaskState{}

/// delete task

final class DeleteTaskSuccessState extends AddTaskState {}
final class DeleteTaskErrorState extends AddTaskState {}
///  select date
final class SelectedDateSuccessState extends AddTaskState {}
final class SelectedDateLoadingState extends AddTaskState {}



