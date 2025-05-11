import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeProfitDetailsChartWidget extends StatelessWidget {
  const HomeProfitDetailsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightDarkColor.withValues(alpha: 0.7),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          LineChart(
            LineChartData(
              minX: 5,
              maxX: 30,
              minY: 20,
              maxY: 100,
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}%',
                        style: AppTextTheme.textTheme.displaySmall,
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          '${value.toInt()}k',
                          style: AppTextTheme.textTheme.displaySmall,
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  isCurved: false,
                  color: AppColors.cadetGrayColor,
                  barWidth: .6,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.cadetGrayColor.withValues(alpha: 0.1),
                  ),
                  spots: const [
                    FlSpot(5, 40),
                    FlSpot(10, 60),
                    FlSpot(15, 80),
                    FlSpot(20, 70),
                    FlSpot(25, 90),
                    FlSpot(30, 100),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '64,266.77',
              style: AppTextTheme.textTheme.labelLarge!.copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
