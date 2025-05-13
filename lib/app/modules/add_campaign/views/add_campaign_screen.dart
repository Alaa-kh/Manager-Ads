import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/validators/forms_validators.dart';
import 'package:manager_ads/app/modules/add_campaign/controllers/add_campaing_controller.dart';
import 'package:manager_ads/app/modules/add_campaign/widgets/add_campaign_dropdown_widget.dart';

class AddCampaignScreen extends StatelessWidget {
  const AddCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCampaingControllerImp());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: addCampaignAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                CustomVerticalSizedBox(height: 50),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'الاسم',
                  prefixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
                  validator:
                      (name) => FormsValidate.getNameValidate(context, name),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 500),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.companyNameController,
                  hintText: 'الشركة',
                  prefixIcon: Image.asset(AppIcons.buildingIcon, width: 20),
                  validator:
                      (name) => FormsValidate.getEmptyValidate(context, name),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 700),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.descriptionController,
                  hintText: 'وصف',
                  prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 900),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.termsController,
                  hintText: 'الشروط',
                  prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1100),
                ),
                // CustomVerticalSizedBox(height: 20),
                // CustomTextField(
                //   controller: controller.driversNumberController,
                //   hintText: 'رقم السائق',
                //   prefixIcon: Image.asset(AppIcons.numberIcon, width: 20),
                // ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.budgetController,
                  hintText: 'الميزانية',
                  prefixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                    delay: Duration(microseconds: 1000),
                    duration: Duration(milliseconds: 1300),
                  ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.regionsController,
                  hintText: 'المناطق',
                  prefixIcon: Image.asset(AppIcons.locationIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1500),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.durationController,
                  hintText: 'المدة',
                  prefixIcon: Image.asset(AppIcons.timeIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1700),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.centersController,
                  hintText: 'المراكز',
                  prefixIcon: Image.asset(AppIcons.centersIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1900),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.driversNumberController,
                  hintText: 'عدد السائقين',
                  prefixIcon: Image.asset(AppIcons.driversCountIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 2100),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  hintText: 'صورة الحملة',
                  prefixIcon: Image.asset(AppIcons.imageIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 2300),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  hintText: 'صورة',
                  prefixIcon: Image.asset(AppIcons.imageIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 2500),
                ),
                CustomVerticalSizedBox(height: 20),
                AddCampaignDropdownWidget().animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 2700),
                ),
                CustomVerticalSizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.miniMumController,
                        textInputType: TextInputType.number,
                        hintText: 'الحد الأدنى',
                        prefixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                    ).animate().slideX(
                      delay: Duration(microseconds: 1000),
                      duration: Duration(milliseconds: 2900),
                    ),
                    CustomHorizontalSizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.maxiMumController,
                        textInputType: TextInputType.number,
                        hintText: 'الحد الأعلى',
                        prefixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                    ).animate().slideX(
                      delay: Duration(microseconds: 1000),
                      duration: Duration(milliseconds: 3100),
                    ),
                  ],
                ),
                CustomVerticalSizedBox(height: 50),
                CustomButtonWidget(text: 'Add'),
                CustomVerticalSizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
