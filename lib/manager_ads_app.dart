import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/splash/splash_screen.dart';

class ManagerAdsApp extends StatelessWidget {
  const ManagerAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      // initialRoute: AppRoutes.login,
      // getPages: AppPages.pages,
      home: SplashScreen(),
    );
  }
}
