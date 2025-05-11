import 'package:manager_ads/app/core/constants/app_packages.dart';

class LoginUpSectionWidget extends StatelessWidget {
  const LoginUpSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 1,
            child: FittedBox(
              child: SvgPicture.asset(
                AppIcons.ellipse1Icon,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 1,
            child: FittedBox(
              child: SvgPicture.asset(
                AppIcons.ellipse2Icon,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
