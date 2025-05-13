import 'package:manager_ads/app/core/constants/app_packages.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.lightDarkColor,
        borderRadius: BorderRadius.circular(50),
      ),

      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.yellowColor, width: 1),
        ),
        child: Text(
          'Login',
          style: AppTextTheme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.yellowColor,
          ),
        ),
      ),
    );
  }
}
