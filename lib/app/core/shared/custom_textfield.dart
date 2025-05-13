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
    this.textInputType
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String value)? validator;
  final bool? obscureText;
  final String? hintText;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          borderSide: BorderSide(
            color: AppColors.lightDarkColor,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextTheme.textTheme.bodyMedium!.copyWith(
          color: AppColors.darkColor,
        ),
        hintTextDirection: TextDirection.rtl,
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.lightDarkColor,
          ),
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: prefixIcon,
        ),
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: suffixIcon!,
                )
                : null,
        // labelStyle: const TextStyle(color: AppColors.whiteColor),
      ),
      // style: const TextStyle(color: AppColors.whiteColor),
    );
  }
}
