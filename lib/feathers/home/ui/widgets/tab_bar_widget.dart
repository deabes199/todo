import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/theme/cubit/theme_cubit.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat.yMMMMd().format(
            DateTime.now(),
          ),
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
            },
            icon: Icon(context.read<ThemeCubit>().isDark
                ? Icons.light_mode
                : Icons.dark_mode))
      ],
    );
  }
}
