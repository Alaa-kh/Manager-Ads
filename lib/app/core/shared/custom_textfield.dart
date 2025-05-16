import 'package:manager_ads/app/core/constants/app_packages.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.hintText,
    this.obscureText,
    this.textInputType,
    this.enabled,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String value)? validator;
  final bool? obscureText;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled:enabled?? true,
      keyboardType: textInputType,
      cursorColor: AppColors.darkColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      validator: validator != null ? (value) => validator!(value!) : null,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightDarkColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightDarkColor),
        ),
        hintText: hintText,
        hintStyle: AppTextTheme.textTheme.bodyMedium!.copyWith(
          color: AppColors.darkColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightDarkColor),
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
  
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(14.0),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
    
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: suffixIcon ?? const SizedBox(width: 24),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
      ),
    );
  }
}
