import 'package:manager_ads/app/core/constants/app_packages.dart';

class LoginRememberWidget extends StatelessWidget {
  const LoginRememberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: false,
            side: const BorderSide(color: AppColors.yellowColor),
            hoverColor: AppColors.yellowColor,
            activeColor: AppColors.yellowColor,
            focusColor: AppColors.yellowColor,
            fillColor: WidgetStateProperty.all(AppColors.whiteColor),
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (bool? value) {},
          ),
          const CustomHorizontalSizedBox(width: 4),
          Text(
            'Remember me',
            style: AppTextTheme.textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
