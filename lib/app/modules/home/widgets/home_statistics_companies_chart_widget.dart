import 'package:manager_ads/app/core/constants/app_packages.dart';

class HomeStatisticsCompaniesChartWidget extends StatelessWidget {
  const HomeStatisticsCompaniesChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIndicator(color: AppColors.softBlueColor, label: 'Persile'),
        const SizedBox(width: 10),
        _buildIndicator(color: AppColors.deepPinkColor, label: 'Persile'),
        const SizedBox(width: 10),
        _buildIndicator(color: AppColors.amethystPurpleColor, label: 'Persile'),
      ],
    );
  }
}

Widget _buildIndicator({required Color color, required String label}) {
  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const CustomHorizontalSizedBox(width: 4),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}
