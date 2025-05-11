import 'package:manager_ads/app/core/constants/app_packages.dart';

class CampaignsPreviousTabWidget extends StatelessWidget {
  const CampaignsPreviousTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
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
            leading: Text(
              r'$ 600.000',
              style: AppTextTheme.textTheme.displayMedium!.copyWith(
                fontSize: 18,
                color: AppColors.darkColor,
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
