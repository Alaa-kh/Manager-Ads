
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/data/models/auth/verify_model.dart';
import 'package:manager_ads/app/data/repo/auth/verify_repo.dart';

abstract class VerifyController extends GetxController {
  Future<void> verify(String code);
}

class VerifyControllerImp extends VerifyController {
  final VerifyRepositoryImpl verifyRepository = VerifyRepositoryImpl();

  @override
  Future<void> verify(String code) async {
    try {
      final verify = await verifyRepository.verify(code: code.toString());
      if (verify is VerifyModel) {
        if (code != verify.data.toString()) {
          Get.snackbar(
            'Success!',
            'Email has been successfully confirmed',
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.off(
            () => LoginScreen(),
            transition: Transition.leftToRight,
            duration: Duration(seconds: 1),
          );
        } else {
          Get.snackbar(
            'Warning!',
            'The code you entered is incorrect, Try again',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Error!',
          'The code you entered is incorrect, Try again',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('================================== $e');
    }
  }


}
