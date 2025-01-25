import 'package:flutter/material.dart';
import 'package:todo_app/core/database/shared_pref.dart';
import 'package:todo_app/core/di/dependancy_injection.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_string.dart';
import 'package:todo_app/core/utils/spacer.dart';
import 'package:todo_app/feathers/onBoarding/data/models/on_boarding_model.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingData.length,
            itemBuilder: (context, currntIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currntIndex != 0
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(
                              AppStrings.skip,
                              style: TextStyle(
                                color: AppColors.white.withOpacity(.44),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  verticalSpace(20),
                  Image.asset(
                      OnBoardingModel.onBoardingData[currntIndex].image),
                  verticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        OnBoardingModel.onBoardingData.length, (index) {
                      return Container(
                        height: 10,
                        width: currntIndex == index ? 30 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: currntIndex == index
                              ? AppColors.primary
                              : AppColors.grey,
                        ),
                      );
                    }),
                  ),
                  verticalSpace(50),
                  Text(OnBoardingModel.onBoardingData[currntIndex].title,
                      style: Theme.of(context).textTheme.displayLarge),
                  verticalSpace(20),
                  Text(
                      textAlign: TextAlign.center,
                      OnBoardingModel.onBoardingData[currntIndex].subTitle,
                      style: Theme.of(context).textTheme.displayMedium),
                  const Spacer(),
                  Row(
                    children: [
                      currntIndex != 0
                          ? TextButton(
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.bounceIn);
                              },
                              child: Text(AppStrings.back,
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                      ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            getIt<CacheHelper>()
                                .saveData(key: AppStrings.isLogin, value: true)
                                .then((value) {
                                   currntIndex == 2
                                ? Navigator.pushReplacementNamed(
                                    context, Routes.homeScreen)
                                : controller.nextPage(
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.bounceIn,
                                  );
                                });
                          },
                          child: Text(
                            currntIndex == 2
                                ? AppStrings.getStarted
                                : AppStrings.next,
                            style: const TextStyle(color: AppColors.white),
                          ))
                    ],
                  )
                ],
              );
            }),
      )),
    );
  }
}
