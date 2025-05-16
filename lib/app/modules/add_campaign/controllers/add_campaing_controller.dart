import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';
import 'package:manager_ads/app/core/shared/custom_loading.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/add_campaing_model.dart';
import 'package:manager_ads/app/data/repo/add_campaing_repo.dart';
import 'package:permission_handler/permission_handler.dart';

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

  List<String> images = []; // ← تعديل: دعم أكثر من صورة
  @override
  Future<void> addCampaing() async {
    if (!formKey.currentState!.validate()) return;
    Get.closeAllSnackbars();

    showLoadingDialog();

    final addCampaing = await addCampaingRepository.addCampaing(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      terms: termsController.text.trim(),
      driversNumber: driversNumberController.text.trim(),
      budget: budgetController.text.trim(),
      images: images, // ✅ ممرر كـ List<String>
      kmPrice: kmPriceController.text.trim(),
      companyName: companyNameController.text.trim(),
      duration: durationController.text.trim(),
      miniMum: miniMumController.text.trim(),
      maxiMum: maxiMumController.text.trim(),
      centers: centersController.text.trim(),
      regions: regionsController.text.trim(),
    );

    if (addCampaing is AddCampaingModel) {
      Get.back(); // ✅ إغلاق اللودينغ
      print('SUCCESS Add Campaing');
      Get.snackbar(
        'تمت العملية بنجاح',
        'تمت إضافة الحملة بنجاح',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (addCampaing is Failures) {
      Get.back(); // إغلاق اللودينغ أيضًا في حالة الخطأ
      Get.snackbar(
        'خطأ!',
        addCampaing.errMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
      );
    }
  }

  void select(String value, TextEditingController textEditingController) {
    textEditingController.text = value;
    update();
  }

  Future<void> pickSingleImage() async {
    final picker = ImagePicker();
    PermissionStatus status;

    if (Platform.isAndroid) {
      status = await Permission.photos.request(); // Android 13+
      if (status.isDenied) {
        status = await Permission.storage.request();
      }
    } else if (Platform.isIOS) {
      status = await Permission.photos.request();
    } else {
      return;
    }

    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        images.add(pickedFile.path); // ← إضافة الصورة للقائمة
        update(); // ← تحديث الواجهة لو كنت تعرض الصور
        print("تمت إضافة صورة: ${pickedFile.path}");
      } else {
        print('لم يتم اختيار صورة');
      }
    } else if (status.isPermanentlyDenied) {
      print('الإذن مرفوض دائمًا، افتح الإعدادات يدويًا');
      openAppSettings();
    } else {
      print('تم رفض الإذن');
    }
  }
}
