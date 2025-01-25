import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/dependancy_injection.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/feathers/add_task/logic/cubit/add_task_cubit.dart';
import 'package:todo_app/feathers/add_task/ui/screens/add_task_screen.dart';
import 'package:todo_app/feathers/home/ui/screens/home_screen.dart';
import 'package:todo_app/feathers/onBoarding/screens/on_boarding_screen.dart';
import 'package:todo_app/feathers/onBoarding/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<AddTaskCubit>()..getTask(),
                  child: const HomeScreen(),
                ));
      case Routes.addTaskScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddTaskCubit>(),
            child: const AddTaskScreen(),
          ),
        );

      default:
        const Scaffold(
          body: Center(
            child: Text('not found'),
          ),
        );
    }
    return null;
  }
}
