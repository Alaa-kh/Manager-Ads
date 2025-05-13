import 'package:manager_ads/app/core/constants/app_packages.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: AppColors.offWhiteColor,
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVerticalSizedBox(height: 25),
              HomeGridInfoWidget(),
              CustomVerticalSizedBox(height: 40),
              Text(
            'Profit Details :',
                style: AppTextTheme.textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                ),
              ),
              CustomVerticalSizedBox(height: 20),
              HomeProfitDetailsChartWidget(),
              CustomVerticalSizedBox(height: 40),
              HomeViewAllCompaniesTextWidget(),
              CustomVerticalSizedBox(height: 20),
              HomeCompaniesChartWidget(),
              CustomVerticalSizedBox(height: 50),
              HomeStatisticsCompaniesChartWidget(),
              CustomVerticalSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


}
