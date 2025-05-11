import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/data/services/app_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const ManagerAdsApp());
}
