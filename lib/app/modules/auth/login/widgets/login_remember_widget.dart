import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/auth/forgot_password/views/forgot_password_screen.dart';
import 'package:manager_ads/app/modules/auth/login/controllers/login_controller.dart';

class LoginRememberWidget extends StatelessWidget {
  const LoginRememberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) {
        return Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             
              Checkbox(
                side: const BorderSide(color: AppColors.yellowColor),
                hoverColor: AppColors.yellowColor,
                activeColor: AppColors.yellowColor,
                focusColor: AppColors.yellowColor,
                value: controller.isChecked,
                onChanged: (bool? value) {
                  controller.checked(value!);
                },
              ),
              Text(
                'Remember me',
                style: AppTextTheme.textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
              ),
              const CustomHorizontalSizedBox(width: 4),

              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(
                    () => ForgotPasswordScreen(),
                    transition: Transition.cupertinoDialog,
                    duration: Duration(seconds: 1),
                  );
                },
                child: Text(
                  'Forget Password?',
                  style: AppTextTheme.textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.yellowColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
