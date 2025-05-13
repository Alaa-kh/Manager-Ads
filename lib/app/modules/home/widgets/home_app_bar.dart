import 'package:manager_ads/app/core/constants/app_packages.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: AppColors.offWhiteColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    title: Text(
      'الصفحة الرئيسية',
      style: AppTextTheme.textTheme.headlineLarge!.copyWith(fontSize: 18),
    ),
    centerTitle: true,
    actionsPadding: const EdgeInsets.only(right: 5),
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(AppIcons.notificationIcon),
      ),
    ],
  );
}
