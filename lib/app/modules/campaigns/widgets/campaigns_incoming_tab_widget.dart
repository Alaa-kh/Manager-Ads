import 'package:manager_ads/app/core/constants/app_packages.dart';

class CampaignsIncomingTabWidget extends StatelessWidget {
  const CampaignsIncomingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:
          (BuildContext context, int index) => ListTile(
            trailing: Image.asset(AppImages.persilImage, width: 55),
            title: Text(
              'برسيل',
              style: AppTextTheme.textTheme.titleLarge!.copyWith(fontSize: 18),
              textAlign: TextAlign.end,
            ),
            subtitle: Text(
              'Yesterday · 19:12',
              style: AppTextTheme.textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: AppColors.mediumGrayColor,
              ),
              textAlign: TextAlign.end,
            ),
            leading: FittedBox(
              child: Row(
                children: [
                  Image.asset(AppIcons.cancelIcon, width: 25),
                  const CustomHorizontalSizedBox(width: 6),
                  Image.asset(AppIcons.trueIcon, width: 20),
                  const CustomHorizontalSizedBox(width: 6),
                  Text(
                    r'$ 600.000',
                    style: AppTextTheme.textTheme.displayMedium!.copyWith(
                      fontSize: 18,
                      color: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      separatorBuilder:
          (BuildContext context, int index) =>
              const CustomVerticalSizedBox(height: 40),
      itemCount: 5,
    );
  }
}
