import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeViewAllCompaniesTextWidget extends StatelessWidget {
  const HomeViewAllCompaniesTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Companies',
          style: AppTextTheme.textTheme.displayMedium!.copyWith(fontSize: 18),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'All',
            style: AppTextTheme.textTheme.displayMedium!.copyWith(
              fontSize: 14,
              color: AppColors.charcoalGrayColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
    
      ],
    );
  }
}
