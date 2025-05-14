import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_loading.dart';
import 'package:manager_ads/app/data/models/add_campaing_model.dart';
import 'package:manager_ads/app/data/repo/add_campaing_repo.dart';

abstract class AddCampaingController extends GetxController {
  Future<void> addCampaing();
}

class AddCampaingControllerImp extends AddCampaingController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController kmPriceController = TextEditingController();
  final TextEditingController driversNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController centersController = TextEditingController();
  final TextEditingController termsController = TextEditingController();
  final TextEditingController regionsController = TextEditingController();
  final TextEditingController miniMumController = TextEditingController();
  final TextEditingController maxiMumController = TextEditingController();

  AddCampaingRepositoryImpl addCampaingRepository = AddCampaingRepositoryImpl();
  AddCampaingModel? addCampaingModel;

  @override
  Future<void> addCampaing() async {
    try {
      if (!formKey.currentState!.validate()) return;
      Get.closeAllSnackbars();

      showLoadingDialog();

      final addCampaing = await addCampaingRepository.addCampaing(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        terms: termsController.text.trim(),
        driversNumber: driversNumberController.text.trim(),
        budget: budgetController.text.trim(),
        kmPrice: kmPriceController.text.trim(),
        companyName: companyNameController.text.trim(),
        duration: durationController.text.trim(),
        miniMum: miniMumController.text.trim(),
        maxiMum: maxiMumController.text.trim(),
        centers: centersController.text.trim(),
        regions: regionsController.text.trim(),
      );
      if (addCampaing is AddCampaingModel) {
        print('================================== SUCCESS Add Campaing');
        Get.snackbar(
          'Success!',
          'The campaign has been added successfully',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.back();
        Get.snackbar(
          'Error!',
          addCampaing.toString(),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('================================== $e');
    }
  }

  void select(String value, TextEditingController textEditingController) {
    textEditingController.text = value;
    update();
  }
}
