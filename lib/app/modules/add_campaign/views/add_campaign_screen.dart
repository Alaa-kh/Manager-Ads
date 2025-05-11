import 'package:manager_ads/app/core/constants/app_packages.dart';

class AddCampaignScreen extends StatelessWidget {
  const AddCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: addCampaignAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              CustomVerticalSizedBox(height: 50),
              AddCampaignDropdownWidget(),
              CustomVerticalSizedBox(height: 40),
              CustomTextField(
                hintText: 'المعلن',
                suffixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
              ),
              CustomVerticalSizedBox(height: 40),
              CustomTextField(
                hintText: 'سعر الكيلومتر ',
                suffixIcon: Image.asset(AppIcons.advertiserIcon, width: 20),
              ),
              CustomVerticalSizedBox(height: 40),
              CustomTextField(
                hintText: 'عدد السائقين',
                suffixIcon: Image.asset(AppIcons.driversCountIcon, width: 20),
              ),
              CustomVerticalSizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'الحد الأدنى',
                      suffixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                    ),
                  ),
                  CustomHorizontalSizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'الحد الأعلى',
                      suffixIcon: Image.asset(AppIcons.limitIcon, width: 20),
                    ),
                  ),
                ],
              ),
              CustomVerticalSizedBox(height: 50),
              CustomButtonWidget(text: 'Add'),
            ],
          ),
        ),
      ),


      
    );
  }
}
