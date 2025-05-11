import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeCompaniesChartWidget extends StatelessWidget {
  const HomeCompaniesChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 90,
          sectionsSpace: 0,
          sections: [
            PieChartSectionData(
              value: 50,
              color: AppColors.softBlueColor,
              title: '50%',
              titleStyle: AppTextTheme.textTheme.labelLarge,
              radius: 30,
            ),
            PieChartSectionData(
              value: 15,
              color: AppColors.deepPinkColor,
              title: '15%',
              titleStyle: AppTextTheme.textTheme.labelLarge,
              radius: 30,
            ),
            PieChartSectionData(
              value: 35,
              color: AppColors.amethystPurpleColor,
              title: '35%',
              titleStyle: AppTextTheme.textTheme.labelLarge,
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
