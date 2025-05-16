import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/validators/forms_validators.dart';
import 'package:manager_ads/app/modules/auth/reset_password/controllers/reset_password_controller.dart';
import 'package:manager_ads/app/widgets/main_app_bar_widget.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordControllerImp());
    final String code = Get.arguments['code'];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: mainAppBar(
        // onTap: () => Get.back(),
        radius: Radius.circular(0),
        backgroundColor: AppColors.whiteColor,
        // Container(
        //   margin: EdgeInsets.only(left: 13),
        //   width: 44,
        //   height: 44,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: AppColors.lightGrayColor,
        //     boxShadow: [
        //       BoxShadow(
        //         color: AppColors.lightDarkColor.withValues(alpha: 0.7),
        //         blurRadius: 10,
        //         spreadRadius: 5,
        //       ),
        //     ],
        //   ),
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 5),
        //     child: Icon(Icons.arrow_back_ios, size: 18),
        //   ),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: GetBuilder<ResetPasswordControllerImp>(
          builder:
              (_) => Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomVerticalSizedBox(height: 50),
                    Text(
                      'New password',
                      style: AppTextTheme.textTheme.displayMedium!.copyWith(
                        color: AppColors.darkModeColor,
                      ),
                    ),               
                    CustomVerticalSizedBox(height: 50),
                    CustomTextField(
                      obscureText: !controller.isPasswordVisible,
                      prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                      hintText: 'New Password',
                      controller: controller.passwordController,
                      validator:
                          (password) => FormsValidate.getPasswordValidate(
                            context,
                            password,
                            isFillOldPassword: true,
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
                      delay: Duration(microseconds: 800),
                      duration: Duration(milliseconds: 800),
                    ),
                    CustomVerticalSizedBox(height: 18),
                    CustomTextField(
                      obscureText: !controller.isConfirmPasswordVisible,
                      prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                      hintText: 'Confirm Password',
                      controller: controller.confirmPasswordController,
                      validator:
                          (confirmPassword) =>
                              FormsValidate.getConfirmPasswordValidate(
                                context,
                                confirmPassword,
                                controller.passwordController.text,
                              ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap:
                              () =>
                                  controller.toggleConfirmPasswordVisibility(),
                          child: SvgPicture.asset(
                            controller.isConfirmPasswordVisible
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
                      delay: Duration(microseconds: 700),
                      duration: Duration(milliseconds: 1000),
                    ),
                    CustomVerticalSizedBox(height: 40),
                    CustomButtonWidget(
                      text: 'Save',
                      onTap: () => controller.resetPassword(code),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
