import 'dart:io';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/validators/forms_validators.dart';
import 'package:manager_ads/app/modules/add_campaign/controllers/add_campaing_controller.dart';
import 'package:manager_ads/app/modules/add_campaign/widgets/add_campaign_centers_dropdown_widget.dart';
import 'package:manager_ads/app/modules/add_campaign/widgets/add_campaign_regions_dropdown_widget.dart';

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
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomVerticalSizedBox(height: 50),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'Name',
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
                  hintText: 'Company',
                  prefixIcon: Image.asset(AppIcons.buildingIcon, width: 20),
                  validator:
                      (name) => FormsValidate.getEmptyValidate(context, name),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 600),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.descriptionController,
                  hintText: 'Description',
                  prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 700),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.termsController,
                  hintText: 'Terms',
                  prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 800),
                ),
             
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  textInputType: TextInputType.number,
                  controller: controller.budgetController,
                  hintText: 'Budget',
                  prefixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 900),
                ),
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  textInputType: TextInputType.number,
                  controller: controller.kmPriceController,
                  hintText: 'Km price',
                  prefixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 900),
                ),
                CustomVerticalSizedBox(height: 20),

                AddCampaignRegionsDropdownWidget().animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1000),
                ),

                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.durationController,
                  hintText: 'Duration',
                  prefixIcon: Image.asset(AppIcons.timeIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1100),
                ),
             
                CustomVerticalSizedBox(height: 20),
                CustomTextField(
                  controller: controller.driversNumberController,
                  hintText: 'Number of drivers',
                  prefixIcon: Image.asset(AppIcons.driversCountIcon, width: 20),
                  validator:
                      (value) => FormsValidate.getEmptyValidate(context, value),
                ).animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1200),
                ),
                CustomVerticalSizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    await controller.pickSingleImage();
                  },
                  child: CustomTextField(
                    enabled: false,
                    hintText: 'Image of the campaign',
                    prefixIcon: Image.asset(AppIcons.imageIcon, width: 20),
                
                  ).animate().slideX(
                    delay: Duration(microseconds: 1000),
                    duration: Duration(milliseconds: 1300),
                  ),
                ),

                CustomVerticalSizedBox(height: 20),
                AddCampaignCentersDropdownWidget().animate().slideX(
                  delay: Duration(microseconds: 1000),
                  duration: Duration(milliseconds: 1400),
                ),
                CustomVerticalSizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.miniMumController,
                        textInputType: TextInputType.number,
                        hintText: 'Minimum',
                        prefixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                    ).animate().slideX(
                      delay: Duration(microseconds: 1000),
                      duration: Duration(milliseconds: 1500),
                    ),
                    CustomHorizontalSizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.maxiMumController,
                        textInputType: TextInputType.number,
                        hintText: 'Maximum',
                        prefixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                    ).animate().slideX(
                      delay: Duration(microseconds: 1000),
                      duration: Duration(milliseconds: 1600),
                    ),
                  ],
                ),
                CustomVerticalSizedBox(height: 50),
                CustomButtonWidget(
                  text: 'Add',
                  onTap: () => controller.addCampaing(),
                ),
                CustomVerticalSizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
