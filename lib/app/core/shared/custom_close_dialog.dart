import '../constants/app_packages.dart';

void closeAllDialogs() {
  while (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
