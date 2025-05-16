import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_close_dialog.dart';
import 'package:manager_ads/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:manager_ads/app/modules/auth/reset_password/views/reset_password_screen.dart';
import 'package:manager_ads/app/modules/auth/verify/widgets/verify_otpInput_field_widget.dart';
import 'package:manager_ads/app/widgets/alert_dialog_widget.dart';
import 'package:manager_ads/app/widgets/main_app_bar_widget.dart';

String code = '';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    void empty(String text) {
      if (text.isEmpty || text.length < 6) {
        Get.snackbar(
          'Error!',
          'Is Empty!',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        closeAllDialogs();
        Get.to(() => ResetPasswordScreen(), arguments: {'code': code});
      }
    }

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GetBuilder<ForgotPasswordControllerImp>(
            builder:
                (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'OTP Verification',
                      style: AppTextTheme.textTheme.displayMedium!.copyWith(
                        fontSize: 26,
                        color: AppColors.darkModeColor,
                      ),
                    ),
                    CustomVerticalSizedBox(height: 10),
                    Text(
                      'Please check your Email to see the verification code',
                      style: AppTextTheme.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.slateGrayColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomVerticalSizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'OTP Code',
                        style: AppTextTheme.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          color: AppColors.darkModeColor,
                        ),
                      ),
                    ),
                    CustomVerticalSizedBox(height: 15),
                    VerifyOtpInputFieldWidget(
                      onCompleted: (val) {
                        setState(() {
                          code = val;
                        });
                        empty(val);
                      },
                    ),
                    CustomVerticalSizedBox(height: 50),
                    CustomButtonWidget(
                      text: 'Verify',
                      onTap: () => empty(code),
                    ),
                    CustomVerticalSizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => TextButton(
                            onPressed:
                                controller.canResend.value
                                    ? () {
                                      closeAllDialogs();
                                      controller.forgotPassword(
                                        AlertDialogWidget(
                                          alignment: Alignment.bottomLeft,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: AppColors.whiteColor,
                                          ),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      );
                                    }
                                    : null,
                            child: Text(
                              controller.canResend.value
                                  ? 'Resend code'
                                  : 'Resend code to',
                              style: TextStyle(
                                color:
                                    controller.canResend.value
                                        ? AppColors.primaryColor
                                        : AppColors.slateGrayColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.canResend.value
                                ? ''
                                : controller.formattedTime,
                            style: TextStyle(
                              color: AppColors.slateGrayColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
