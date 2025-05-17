import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/add_campaign/controllers/add_campaing_controller.dart';

List<String> regions = ['دمشق', 'القاهرة'];

class AddCampaignRegionsDropdownWidget extends StatelessWidget {
  const AddCampaignRegionsDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCampaingControllerImp>(
      builder:
          (controller) => DropdownButtonFormField<String>(
            alignment: Alignment.centerLeft,
            itemHeight: 52,
            value:
                regions.contains(controller.regionsController.text)
                    ? controller.regionsController.text
                    : null,
            items:
                regions
                    .map(
                      (value) =>
                          DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
            onChanged: (value) {
              controller.select(value!, controller.regionsController);
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Image.asset(AppIcons.buildingIcon, width: 20),
              ),
              labelText: 'Regions',
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
