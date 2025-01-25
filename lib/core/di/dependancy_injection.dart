import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/shared_pref.dart';
import 'package:todo_app/core/database/sqflite_helper.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

final getIt = GetIt.instance;
void diSetUp() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
  getIt.registerFactory<AddTaskCubit>(() => AddTaskCubit());
}
