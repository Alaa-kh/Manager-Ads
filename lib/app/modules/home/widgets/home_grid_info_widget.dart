import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeGridInfoWidget extends StatelessWidget {
  const HomeGridInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 17,
        mainAxisExtent: 106,
      ),
      itemBuilder:
          (BuildContext context, int index) => Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightDarkColor.withValues(alpha: 0.7),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          index == 0
                              ? 'Number of drivers'
                              : index == 1
                              ? 'Number of requests'
                              : index == 2
                              ? 'Number of companies'
                              : 'Number of campaigns',
                          style: AppTextTheme.textTheme.displayMedium!.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '40,689',
                          style: AppTextTheme.textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      index == 0
                          ? AppIcons.driversIcon
                          : index == 1
                          ? AppIcons.requestsIcon
                          : index == 2
                          ? AppIcons.companiesIcon
                          : AppIcons.campaignsIcon,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1.3% ',
                            style: AppTextTheme.textTheme.labelLarge!.copyWith(
                              fontSize: 10,
                              color: AppColors.greenColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Higher than last week ',
                            style: AppTextTheme.textTheme.labelLarge!.copyWith(
                              fontSize: 10,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const CustomHorizontalSizedBox(width: 4),
                    Icon(
                      Icons.trending_up,
                      color: AppColors.greenColor,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
