import 'package:manager_ads/app/core/constants/app_packages.dart';

class CampaignsTabBarWidget extends StatelessWidget {
  const CampaignsTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CampaignsControllerImp controller = Get.put(CampaignsControllerImp());

    return Positioned(
      bottom: -30,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.cadetGrayColor.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 6),
              ),
            ],
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 74,
          width: 300,
          child: Obx(() {
            return TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(),
              onTap: controller.changeTab,
              unselectedLabelStyle: AppTextTheme.textTheme.displayMedium
                  ?.copyWith(
                    color: AppColors.almostBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
              labelStyle: AppTextTheme.textTheme.displayMedium?.copyWith(
                color: AppColors.almostBlackColor,
                fontSize: 15,
              ),
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.previousIcon,
                    colorFilter: ColorFilter.mode(
                      controller.selectedTabIndex.value == 0
                          ? AppColors.yellowColor
                          : AppColors.mediumGrayColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  text: 'السابقة',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    AppIcons.incomingIcon,
                    colorFilter: ColorFilter.mode(
                      controller.selectedTabIndex.value == 1
                          ? AppColors.yellowColor
                          : AppColors.mediumGrayColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  text: 'الواردة',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
