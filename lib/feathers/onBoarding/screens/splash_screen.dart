import 'package:flutter/material.dart';
import 'package:todo_app/core/database/shared_pref.dart';
import 'package:todo_app/core/di/dependancy_injextion.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    bool isLogin = getIt<CacheHelper>().getData(key: AppStrings.isLogin) ?? false;
    Future.delayed(const Duration(seconds: 1), () {

      Navigator.pushNamed(context,isLogin?Routes.homeScreen: Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            verticalSpace(20),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
    );
  }
}
