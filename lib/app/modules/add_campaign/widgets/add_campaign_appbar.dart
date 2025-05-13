import 'package:manager_ads/app/core/constants/app_packages.dart';

AppBar addCampaignAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.whiteColor,
    title: Text(
     'Add an advertising campaign',
      style: AppTextTheme.textTheme.bodyMedium!.copyWith(fontSize: 16),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
    ],
  );
}
