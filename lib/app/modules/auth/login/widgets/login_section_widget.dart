import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/validators/forms_validators.dart';
import 'package:manager_ads/app/modules/auth/login/controllers/login_controller.dart';

class LoginSectionWidget extends StatelessWidget {
  const LoginSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(LoginControllerImp());
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
          child: GetBuilder<LoginControllerImp>(
            builder:
                (controller) => Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const CustomVerticalSizedBox(height: 30),
                      LoginTextWidget(),
                      const CustomVerticalSizedBox(height: 25),
                    CustomTextField(
                        prefixIcon: SvgPicture.asset(AppIcons.nameIcon),
                        hintText: 'Full Name',
                        controller: controller.nameController,
                        validator:
                            (name) =>
                                FormsValidate.getEmptyValidate(context, name),
                      ).animate().slideX(
                        delay: Duration(microseconds: 1200),
                        duration: Duration(milliseconds: 500),
                      ),
                      const CustomVerticalSizedBox(height: 18),

                      CustomTextField(
                        obscureText: !controller.isPasswordVisible,
                        prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                        hintText: 'Password',
                        controller: controller.passwordController,
                        validator:
                            (password) => FormsValidate.getEmptyValidate(
                              context,
                              password,
                            ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => controller.togglePasswordVisibility(),
                            child: SvgPicture.asset(
                              controller.isPasswordVisible
                                  ? AppIcons.eyeIcon
                                  : AppIcons.eyeVisibilityIcon,
                              width: 19,
                              height: 19,
                              colorFilter: ColorFilter.mode(
                                AppColors.warmGrayColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ).animate().slideX(
                        delay: Duration(microseconds: 1000),
                        duration: Duration(milliseconds: 1000),
                      ),
                      const CustomVerticalSizedBox(height: 11),
                      LoginRememberWidget(),
                      const CustomVerticalSizedBox(height: 30),
                      CustomButtonWidget(
                        text: 'Login',
                        onTap: () {
                          controller.login();
                        },
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
