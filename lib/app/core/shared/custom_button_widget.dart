import 'package:manager_ads/app/core/constants/app_packages.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, required this.text, this.onTap,  this.fontSize});
  final String text;
  final double? fontSize;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            fontSize: fontSize ?? 16.0
          ),
        ),
      ),
    );
  }
}
