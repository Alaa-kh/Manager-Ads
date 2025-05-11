import 'package:manager_ads/app/core/constants/app_packages.dart';

class AddCampaignDropdownWidget extends StatelessWidget {
  const AddCampaignDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
        alignment: Alignment.centerRight,
        itemHeight: 52,
        value: '',
        items: [],
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Image.asset(AppIcons.buildingIcon, width: 20),
          ),
          labelText: 'الشركة',
          labelStyle: AppTextTheme.textTheme.bodyMedium!.copyWith(
            color: AppColors.darkColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightDarkColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightDarkColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightDarkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightDarkColor),
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.warmGrayColor,
          ),
        ),
      ),
    );
  }
}
