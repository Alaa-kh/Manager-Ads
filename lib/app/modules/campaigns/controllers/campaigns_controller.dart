import 'package:manager_ads/app/core/constants/app_packages.dart';


abstract class CampaignsController extends GetxController {
  RxInt selectedTabIndex = 0.obs; 
}

class CampaignsControllerImp extends CampaignsController {
  void changeTab(int index) {
    selectedTabIndex.value = index; 
  }
}
