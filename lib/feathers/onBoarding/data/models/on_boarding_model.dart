import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_string.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.image, required this.title, required this.subTitle});
  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        image: AppAssets.on1,
        title: AppStrings.onBoardingTitleOne,
        subTitle: AppStrings.onBoardingSubTitleOne),
    OnBoardingModel(
        image: AppAssets.on2,
        title: AppStrings.onBoardingTitleTwo,
        subTitle: AppStrings.onBoardingSubTitleTwo),
    OnBoardingModel(
        image: AppAssets.on3,
        title: AppStrings.onBoardingTitleThree,
        subTitle: AppStrings.onBoardingSubTitleThree),
  ];
}
