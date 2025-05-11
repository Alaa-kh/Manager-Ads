
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/validators/forms_validators.dart';
import 'package:manager_ads/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
       
      
        backgroundColor: AppColors.whiteColor,
     leading:  IconButton(
          onPressed: () => Get.back(),
       icon: Container(
            margin: EdgeInsets.only(left: 13),
            alignment: Alignment.center,
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightDarkColor.withValues(alpha: .7),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios, size: 13),
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
                        'Enter your email account to reset  your password',
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
                      ),
                      CustomVerticalSizedBox(height: 40),
                      CustomButtonWidget(
                        text: 'Reset Password',
                        onTap: () => controller.forgotPassword(),
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
