import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/auth/resend_code_model.dart';
import 'package:manager_ads/app/data/models/auth/verify_email_model.dart';
import 'package:manager_ads/app/data/repo/auth/verify_email_repo.dart';
import 'package:manager_ads/app/modules/auth/login/controllers/login_controller.dart';
import 'package:manager_ads/app/modules/auth/login/views/login_screen.dart';

abstract class VerifyController extends GetxController {
  Future<void> verify(String code);
  Future<void> resendCode();
}

class VerifyControllerImp extends VerifyController {
  VerifyRepositoryImpl verifyRepository = VerifyRepositoryImpl();

  late Timer timer;
  int remainingSeconds = 60;
  var formattedTime = ''.obs;
  RxBool canResend = false.obs;

  ResendCodeModel? resendCodeModel;

  void startTimer() {
    canResend.value = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      remainingSeconds--;
      formattedTime.value = formatTime(remainingSeconds);

      update();

      if (remainingSeconds <= 0) {
        timer.cancel();
        canResend.value = true;
        remainingSeconds = 60;
        formattedTime.value = '';
        update();
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$sec';
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }


  late String resendCodeMessage;
  Future<void> resendCode() async {
    if (!canResend.value) return;

    canResend.value = false;

    final result = await verifyRepository.resendCode();

    if (result is ResendCodeModel) {
      resendCodeMessage = 'تم إرسال الكود مجدداً';
      Get.snackbar(
        'Success!',
        resendCodeMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      Get.snackbar(
        'Error!',
        'فشل في إرسال الكود، حاول مرة أخرى.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      canResend.value = true;
      return;
    }

    int time = 30;
    formattedTime.value = '00:$time';
    for (int i = time - 1; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      formattedTime.value = '00:${i < 10 ? '0$i' : '$i'}';
    }

    canResend.value = true;
  }

  @override
  Future<void> verify(String code) async {
    if (code.length < 6) {
      Get.snackbar(
        'خطأ',
        'الرجاء إدخال الكود كاملاً',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    print('Verify called with code: $code');

    try {
      final result = await verifyRepository.verify(code: code);

      if (result is VerifyModel) {
        Get.snackbar(
          'Success!',
          'تم التحقق بنجاح',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );

        Get.off(
          () => LoginScreen(),
          transition: Transition.leftToRight,
          duration: Duration(seconds: 1),
        );
      } else if (result is Failures) {
        Get.snackbar(
          'خطأ',
          result.errMessage,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          'حدث خطأ غير متوقع',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء التحقق',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    update();
  }
}
