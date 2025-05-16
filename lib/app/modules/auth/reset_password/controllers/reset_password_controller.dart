import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_loading.dart';
import 'package:manager_ads/app/data/repo/auth/reset_password_repo.dart';

abstract class ResetPasswordController extends GetxController {
  Future<void> resetPassword(String codee);
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ResetPasswordRepositoryImpl resetPasswordRepository =
      ResetPasswordRepositoryImpl();

  bool isPasswordVisible = false;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  bool isConfirmPasswordVisible = false;
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  @override
  Future<void> resetPassword(String codee) async {
    if (!formKey.currentState!.validate()) return;

    showLoadingDialog();

    final result = await resetPasswordRepository.resetPassword(
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
      code: codee,
    );

    result.fold(
      (failure) {
        Get.back();
        Get.snackbar(
          'Error!',
          failure.errMessage,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (resetPassword) {
        Get.back();
        if (resetPassword.errors != null && resetPassword.errors!.isNotEmpty) {
          Get.snackbar(
            'Error!',
            resetPassword.errors!.first.toString(),
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'Success!',
            resetPassword.message ?? 'Password reset successfully',
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.off(
            () => LoginScreen(),
            transition: Transition.rightToLeft,
            duration: Duration(seconds: 1),
          );
        }
      },
    );
  }
}
