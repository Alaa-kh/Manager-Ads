import 'package:manager_ads/app/core/constants/app_packages.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootController());
    return GetBuilder<RootController>(
      builder:
          (_) => Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: controller.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex,
              elevation: 15,
              unselectedItemColor: AppColors.mediumGrayColor,
              selectedItemColor: AppColors.yellowColor,
              onTap: (value) => controller.seletedPage(value),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    width: 35,
                    AppIcons.homeIcon,
                    colorBlendMode: BlendMode.srcIn,
                    color:
                        controller.currentIndex == 0
                            ? AppColors.yellowColor
                            : AppColors.mediumGrayColor,
                  ),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                     width: 35,
                    AppIcons.driverIcon,
                    colorBlendMode: BlendMode.srcIn,
                    color:
                        controller.currentIndex == 1
                            ? AppColors.yellowColor
                            : AppColors.mediumGrayColor,
                  ),
                  label: 'Drivers',
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppIcons.companyIcon,
                    width: 35,
                    colorBlendMode: BlendMode.srcIn,
                    color:
                        controller.currentIndex == 2
                            ? AppColors.yellowColor
                            : AppColors.mediumGrayColor,
                  ),
                  label: 'Companies',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppIcons.commercialIcon,
                   width: 35,
                    colorBlendMode: BlendMode.srcIn,
                    color:
                        controller.currentIndex == 3
                            ? AppColors.yellowColor
                            : AppColors.mediumGrayColor,
                  ),
                  label: 'Campaigns',
                ),
              ],
            ),
          ),
    );
  }
}
