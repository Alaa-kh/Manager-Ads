import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/campaigns/views/campaigns_screen.dart';

class RootController extends GetxController {
  int currentIndex = 0;
  void seletedPage(int index) {
    currentIndex = index;
    update();
  }

  final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> campaignsNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> driversNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  List<Widget> get screens => [
 
    Navigator(
      key: driversNavigatorKey,
      onGenerateRoute:
          (settings) => MaterialPageRoute(builder: (_) => const HomeScreen()),
    ),
    Navigator(
      key: profileNavigatorKey,
      onGenerateRoute:
          (settings) =>
              MaterialPageRoute(builder: (_) => const CampaignsScreen()),
    ),
    Navigator(
      key: homeNavigatorKey,
      onGenerateRoute:
          (settings) => MaterialPageRoute(builder: (_) => const HomeScreen()),
    ),
    Navigator(
      key: campaignsNavigatorKey,
      onGenerateRoute:
          (settings) =>
              MaterialPageRoute(builder: (_) => const CampaignsScreen()),
    ),
  ];
}
