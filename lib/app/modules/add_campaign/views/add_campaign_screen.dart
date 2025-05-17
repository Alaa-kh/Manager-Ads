import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/modules/add_campaign/controllers/add_campaing_controller.dart';
import 'package:manager_ads/app/modules/add_campaign/widgets/add_campaign_centers_dropdown_widget.dart';
import 'package:manager_ads/app/modules/add_campaign/widgets/add_campaign_regions_dropdown_widget.dart';

class AddCampaignScreen extends StatelessWidget {
  const AddCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCampaingControllerImp());

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('تأكيد الخروج', textAlign: TextAlign.center),
                content: const Text(
                  'هل أنت متأكد أنك تريد الخروج؟ سيتم فقدان البيانات غير المحفوظة.',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('لا'),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.clearForm(); // تفريغ النموذج
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('نعم'),
                      ),
                    ],
                  ),
                ],
              ),
        );

        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: addCampaignAppBar(),
        body: GetBuilder<AddCampaingControllerImp>(
          builder:
              (_) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const CustomVerticalSizedBox(height: 50),
                      CustomTextField(
                        controller: controller.nameController,
                        hintText: 'Name',
                        prefixIcon: Image.asset(
                          AppIcons.advertiserIcon,
                          width: 20,
                        ),
                        validator:
                            (name) =>
                                FormsValidate.getNameValidate(context, name),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        controller: controller.companyNameController,
                        hintText: 'Company',
                        prefixIcon: Image.asset(
                          AppIcons.buildingIcon,
                          width: 20,
                        ),
                        validator:
                            (name) =>
                                FormsValidate.getEmptyValidate(context, name),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        controller: controller.descriptionController,
                        hintText: 'Description',
                        prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        controller: controller.termsController,
                        hintText: 'Terms',
                        prefixIcon: Image.asset(AppIcons.listIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        textInputType: TextInputType.number,
                        controller: controller.budgetController,
                        hintText: 'Budget',
                        prefixIcon: Image.asset(
                          AppIcons.advertiserIcon,
                          width: 20,
                        ),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        textInputType: TextInputType.number,
                        controller: controller.kmPriceController,
                        hintText: 'Km price',
                        prefixIcon: Image.asset(
                          AppIcons.advertiserIcon,
                          width: 20,
                        ),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      AddCampaignRegionsDropdownWidget(),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        controller: controller.durationController,
                        hintText: 'Duration',
                        prefixIcon: Image.asset(AppIcons.timeIcon, width: 20),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),
                      CustomTextField(
                        controller: controller.driversNumberController,
                        hintText: 'Number of drivers',
                        prefixIcon: Image.asset(
                          AppIcons.driversCountIcon,
                          width: 20,
                        ),
                        validator:
                            (value) =>
                                FormsValidate.getEmptyValidate(context, value),
                      ),
                      const CustomVerticalSizedBox(height: 20),

                      /// Pick Image
                      GestureDetector(
                        onTap: () async => await controller.pickSingleImage(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightDarkColor),
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppIcons.imageIcon, width: 20),
                              const CustomHorizontalSizedBox(width: 10),
                              Expanded(
                                child: GetBuilder<AddCampaingControllerImp>(
                                  builder: (controller) {
                                    return Text(
                                      controller.images.isNotEmpty
                                          ? controller.images.last
                                              .split('/')
                                              .last
                                          : 'Image of the campaign',
                                      style: AppTextTheme.textTheme.bodyMedium!
                                          .copyWith(color: AppColors.darkColor),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const CustomVerticalSizedBox(height: 20),
                      AddCampaignCentersDropdownWidget(),
                      const CustomVerticalSizedBox(height: 20),

                      /// Min / Max
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller.miniMumController,
                              textInputType: TextInputType.number,
                              hintText: 'Minimum',
                              prefixIcon: Image.asset(
                                AppIcons.limitIcon,
                                width: 20,
                              ),
                              validator:
                                  (value) => FormsValidate.getEmptyValidate(
                                    context,
                                    value,
                                  ),
                            ),
                          ),
                          const CustomHorizontalSizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: controller.maxiMumController,
                              textInputType: TextInputType.number,
                              hintText: 'Maximum',
                              prefixIcon: Image.asset(
                                AppIcons.limitIcon,
                                width: 20,
                              ),
                              validator:
                                  (value) => FormsValidate.getEmptyValidate(
                                    context,
                                    value,
                                  ),
                            ),
                          ),
                        ],
                      ),

                      const CustomVerticalSizedBox(height: 50),

                      CustomButtonWidget(
                        text: 'Add',
                        onTap: () => controller.addCampaing(),
                      ),
                      const CustomVerticalSizedBox(height: 25),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
