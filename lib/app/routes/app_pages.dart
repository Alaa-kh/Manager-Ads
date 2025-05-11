
import 'package:manager_ads/app/core/constants/app_packages.dart';

class AppPages {
  static final pages = [
     GetPage(name: AppRoutes.root, page: () => const RootScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  ];
}
