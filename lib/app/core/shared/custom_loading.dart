import 'package:lottie/lottie.dart';
import 'package:manager_ads/app/core/constants/app_animations.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';

void showLoadingDialog() {
  Get.dialog(
    barrierDismissible: false,
    const PopScope(
      canPop: false,
      child: Center(child: MainCircularProgressWidget()),
    ),
  );
}

class MainCircularProgressWidget extends StatelessWidget {
  const MainCircularProgressWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAnimations.loadingAnimate, animate: true),
    );
  }
}

