import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/auth/login/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginControllerImp>(() => LoginControllerImp());
  }
}
