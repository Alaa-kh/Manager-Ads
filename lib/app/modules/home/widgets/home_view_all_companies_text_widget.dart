import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeViewAllCompaniesTextWidget extends StatelessWidget {
  const HomeViewAllCompaniesTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'الكل',
            style: AppTextTheme.textTheme.displayMedium!.copyWith(
              fontSize: 14,
              color: AppColors.charcoalGrayColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          'الشركات',
          style: AppTextTheme.textTheme.displayMedium!.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
