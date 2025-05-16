import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_close_dialog.dart';
import 'package:manager_ads/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:manager_ads/app/modules/auth/verify/views/verify_screen.dart';
import 'package:manager_ads/app/widgets/alert_dialog_widget.dart';
import 'package:manager_ads/app/widgets/main_app_bar_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: mainAppBar(
        onTap: () {
          closeAllDialogs();
          Get.back();
        },
        radius: Radius.circular(0),
        backgroundColor: AppColors.whiteColor,
        leadingIcon: Container(
          margin: EdgeInsets.only(left: 13),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGrayColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightDarkColor.withAlpha(70),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(Icons.arrow_back_ios, size: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<ForgotPasswordControllerImp>(
            builder:
                (_) => Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomVerticalSizedBox(height: 50),
                      Text(
                        'Forgot password',
                        style: AppTextTheme.textTheme.displayMedium!.copyWith(
                          color: AppColors.darkModeColor,
                        ),
                      ),
                      CustomVerticalSizedBox(height: 10),
                      Text(
                        'Enter your email account to reset your password',
                        style: AppTextTheme.textTheme.headlineLarge!.copyWith(
                          color: AppColors.slateGrayColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      CustomVerticalSizedBox(height: 50),
                      CustomTextField(
                        prefixIcon: Image.asset(AppIcons.emailIcon, width: 30),
                        hintText: 'Enter Your Email',
                        controller: controller.emailController,
                        validator:
                            (email) =>
                                FormsValidate.getEmailValidate(context, email),
                      ).animate().slideX(
                        delay: Duration(microseconds: 1200),
                        duration: Duration(milliseconds: 500),
                      ),
                      CustomVerticalSizedBox(height: 40),
                      CustomButtonWidget(
                        text: 'Reset Password',
                        onTap: () {
                          closeAllDialogs();
                          controller.forgotPassword(
                            AlertDialogWidget(
                              alignment: Alignment.bottomRight,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: AppColors.whiteColor,
                              ),
                              onTap: () {
                                closeAllDialogs();
                                Get.to(() => VerifyScreen());
                              },
                            ),
                          );
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
