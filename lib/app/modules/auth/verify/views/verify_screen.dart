import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:manager_ads/app/modules/auth/reset_password/views/reset_password_screen.dart';
import 'package:manager_ads/app/widgets/main_app_bar_widget.dart';
import 'package:pinput/pinput.dart';

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
        Get.to(() => ResetPasswordScreen(), arguments: {'code': code});
      }
    }

    final controller = Get.put(ForgotPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: mainAppBar(
        onTap: () => Get.back(),
        radius: Radius.circular(0),
        backgroundColor: AppColors.whiteColor,
          Container(
          margin: EdgeInsets.only(left: 13),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGrayColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightDarkColor.withValues(alpha: 0.7),
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
            builder:(_)=> Column(
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
                  'Please check your Email  to see the verification code',
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
                AutofillGroup(
                  child: Pinput(
                    isCursorAnimationEnabled: true,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    keyboardType: TextInputType.number,
                    separatorBuilder:
                        (index) => CustomHorizontalSizedBox(width: 20),
                    length: 6,
                    onCompleted: (pin) {
                      setState(() {
                        code = pin;
                        empty(pin);
                      });
                    },
                    useNativeKeyboard: true,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 55,
                      height: 60,
                      textStyle: AppTextTheme.textTheme.titleLarge!.copyWith(
                        fontSize: 19,
                        color: AppColors.darkModeColor,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightGrayColor,
                      ),
                    ),
                  ).animate().flipV(
                    delay: Duration(microseconds: 700),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                CustomVerticalSizedBox(height: 50),
                CustomButtonWidget(
                  text: 'Verify',
                  onTap: () {
                    empty(code);
                  },
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
                                  controller.forgotPassword();
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
