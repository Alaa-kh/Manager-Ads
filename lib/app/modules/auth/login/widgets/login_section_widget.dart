import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';

class LoginSectionWidget extends StatelessWidget {
  const LoginSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomVerticalSizedBox(height: 30),
              LoginTextWidget(),
              const CustomVerticalSizedBox(height: 25),
              CustomTextField(
                suffixIcon: SvgPicture.asset(AppIcons.phoneIcon),
                hintText: 'الاسم الكامل',
              ).animate().slideX(
                    delay: Duration(microseconds: 1200),
                    duration: Duration(milliseconds: 500),
                  ),
              const CustomVerticalSizedBox(height: 18),
              CustomTextField(
                suffixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                hintText: 'كلمة السر',
              ).animate().slideX(
                    delay: Duration(microseconds: 1000),
                    duration: Duration(milliseconds: 1000),
                  ),
              const CustomVerticalSizedBox(height: 11),
              LoginRememberWidget(),
              const CustomVerticalSizedBox(height: 30),
              CustomButtonWidget(
                text: 'تسجيل الدخول',
                onTap: () {
                  Get.to(() => HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
