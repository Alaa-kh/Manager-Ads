import 'package:manager_ads/app/core/constants/app_packages.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            CampaignsUpWidget(),
            const CustomVerticalSizedBox(height: 40),
            Expanded(
              child: TabBarView(
                children: [
                  CampaignsPreviousTabWidget(),
                  CampaignsIncomingTabWidget(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: InkWell(
     onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddCampaignScreen()),
            );
          },
          child: SvgPicture.asset(AppIcons.addIcon),
        ),
      ),
    );
  }
}
