import 'package:manager_ads/app/core/constants/app_packages.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.icon,
    required this.onTap,
    required this.alignment,
  });

  final Widget icon;
  final Function() onTap;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      surfaceTintColor: AppColors.yellowColor,
      backgroundColor: AppColors.whiteColor,
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(AppIcons.messageIcon, width: 44, height: 44),
            const CustomVerticalSizedBox(height: 15),
            Text(
              'Check your Email',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const CustomVerticalSizedBox(height: 10),
            Text(
              'We have sent password recovery instructions to your email',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff7D848D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const CustomVerticalSizedBox(height: 10),
            Align(
              alignment: alignment,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  width: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                ),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
