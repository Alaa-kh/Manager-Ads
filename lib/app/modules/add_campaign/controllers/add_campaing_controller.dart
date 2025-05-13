import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/data/models/add_campaing_model.dart';
import 'package:manager_ads/app/data/repo/add_campaing_repo.dart';

abstract class AddCampaingController extends GetxController {}

class AddCampaingControllerImp extends AddCampaingController {
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

  
}
