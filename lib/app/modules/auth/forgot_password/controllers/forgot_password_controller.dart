import 'dart:async';

import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_loading.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/auth/forgot_password_model.dart';
import 'package:manager_ads/app/data/repo/auth/forgot_password_repo.dart';

abstract class ForgotPasswordController extends GetxController {
  Future<void> forgotPassword(Widget dialog);
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final ForgotPasswordRepositoryImpl forgotPasswordRepository =
      ForgotPasswordRepositoryImpl();

  // === Timer Variables ===
  final RxInt _start = 90.obs;
  final RxBool canResend = false.obs;
  Timer? _timer;

  String get formattedTime {
    final minutes = (_start.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer() {
    _start.value = 90;
    canResend.value = false;

    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start.value == 0) {
        timer.cancel();
        canResend.value = true;
      } else {
        _start.value--;
      }
    });
  }

  @override
  Future<void> forgotPassword(Widget dialog) async {
    try {
      if (!formKey.currentState!.validate()) return;

      Get.closeAllSnackbars();
      showLoadingDialog();

      final result = await forgotPasswordRepository.forgotPassword(
        email: emailController.text.trim(),
      );
      Get.closeAllSnackbars();
      Get.back();

      if (result is ForgotPasswordModel) {
        // إذا كان في errors من الباك
        if (result.errors != null && result.errors!.isNotEmpty) {
          Get.snackbar(
            'خطأ!',
            result.errors!.first,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          startTimer();
          Get.dialog(
            dialog.animate().scaleY(
              delay: Duration(microseconds: 100),
              duration: Duration(milliseconds: 800),
            ),
            barrierDismissible: true,
          );
        }
      } else if (result is Failures) {
        Get.snackbar(
          'خطأ!',
          result.errMessage,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ!',
          'Unexpected response: $result',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'خطأ استثناء!',
        'حدث استثناء: $e',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Exception: $e');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
