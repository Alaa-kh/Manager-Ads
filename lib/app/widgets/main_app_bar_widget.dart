


import 'package:manager_ads/app/core/constants/app_packages.dart';

AppBar mainAppBar(
  Widget leadingIcon, {
  Radius? radius,
  String? title,
  List<Widget>? actions,
  Color? titleColor,
  Function()? onTap,
  Color? backgroundColor,
  String? backgroundImagePath,
}) {
  final borderRadius = radius ?? Radius.circular(30);

  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: backgroundColor ?? AppColors.primaryColor,
    toolbarHeight: 90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: borderRadius),
    ),
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: borderRadius),
      child:
          backgroundImagePath != null
              ? Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  backgroundImagePath,
                  fit: BoxFit.fitWidth,
                  width: 350,
                ),
              )
              : null,
    ),
    leading: InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: leadingIcon,
    ),
    title: Text(
      title ?? '',
      style: AppTextTheme.textTheme.headlineLarge!.copyWith(
        fontSize: 18,
        color: titleColor ?? AppColors.whiteColor,
      ),
    ),
    centerTitle: true,
    actionsPadding: const EdgeInsets.only(right: 5),
    actions: actions ?? [],
  );
}
