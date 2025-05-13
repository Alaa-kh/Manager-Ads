import 'dart:async';

import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/data/models/auth/resend_code_model.dart';
import 'package:manager_ads/app/data/models/auth/verify_email_model.dart';
import 'package:manager_ads/app/data/repo/auth/verify_email_repo.dart';


abstract class VerifyController extends GetxController {
  Future<void> verify(String code);
  Future<void> resendCode();
}

class VerifyControllerImp extends VerifyController {
  final VerifyRepositoryImpl verifyRepository = VerifyRepositoryImpl();

  ResendCodeModel? resendCodeModel;

  // === Timer Variables ===
  final RxInt _start = 90.obs;
  final RxBool canResend = false.obs;
  Timer? _timer;

  // Getter for UI to bind with
  String get formattedTime {
    final minutes = (_start.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer() {
    _start.value = 90;
    canResend.value = false;

    _timer?.cancel(); // Cancel any existing timer

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
  void onInit() {
    super.onInit();
    startTimer(); // Start timer when controller is initialized
  }

  @override
  Future<void> verify(String code) async {
    print('MMMMMMMMMMMMMMMMMMMMMMMMMM $code');
    try {
      final verify = await verifyRepository.verify(code: code.toString());
      if (verify is VerifyModel) {
        print('SSSSSSSSSSSSSSSSSSSS $code');
        if (code.isEmpty || code.length < 6) {
          Get.snackbar(
            'Error!',
            'Code Is Empty!',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.to(() => LoginScreen());
        }
      } else {
        Get.snackbar(
          'Error!',
          verify,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('================================== $e');
    }
  }

  @override
  Future<void> resendCode() async {
    print('=================== FFFF');

    final result = await verifyRepository.resendCode();

    if (result is ResendCodeModel) {
      resendCodeModel = result;
      print('=================== SUCCESS Resend Code');
      startTimer(); // Restart the timer on resend
    } else {
      // Handle failure if needed
    }
    update();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
