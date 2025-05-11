
import 'package:manager_ads/app/core/constants/app_packages.dart';

class CampaignsUpWidget extends StatelessWidget {
  const CampaignsUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          height: 141,
        ),
        Positioned(
          left: 1,
          bottom: 1,
          child: SvgPicture.asset(AppIcons.ellipseIcon)),
        CampaignsTabBarWidget(),
      ],
    );
  }
}
