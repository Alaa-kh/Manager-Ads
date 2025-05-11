import 'package:manager_ads/app/core/constants/app_packages.dart';

class ManagerAdsApp extends StatelessWidget {
  const ManagerAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
 
    );
  }
}
