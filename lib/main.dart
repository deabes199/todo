import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/database/shared_pref.dart';
import 'package:todo_app/core/database/sqflite_helper.dart';
import 'package:todo_app/core/di/dependancy_injextion.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/theme/cubit/theme_cubit.dart';
import 'package:todo_app/core/theme/get_theme_mode.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diSetUp();
  await getIt<CacheHelper>().init();
  getIt<SqfliteHelper>().initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddTaskCubit()..getTask(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit()..getTheme(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: getThemeMode(),
                darkTheme: getDarkThemeMode(),
                themeMode: context.read<ThemeCubit>().isDark
                    ? ThemeMode.light
                    : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter().onGenerateRoute,
                initialRoute: Routes.splashScreen,
              );
            },
          ),
        );
      },
    );
  }
}
