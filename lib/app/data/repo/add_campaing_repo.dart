
import 'package:manager_ads/app/core/constants/app_api.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/add_campaing_model.dart';
import 'package:manager_ads/app/data/network/crud.dart';

abstract class AddCampaingRepository {}
class AddCampaingRepositoryImpl extends AddCampaingRepository{
Future addCampaing({
    required String name,
    required String companyName,
    required String kmPrice,
    required String driversNumber,
    required String description,
    required String budget,
    required String duration,
    required String centers,
    required String terms,
    required String regions,
    required String miniMum,
    required String maxiMum,
    required List<String> images, // ✅ عدلنا نوع المتغير إلى List<String>
  }) async {
    return _postData(
      url: AppApi.addAds,
      fromJson: (json) => AddCampaingModel.fromJson(json),
      photo: images, // ✅ نرسل قائمة الصور
      body: {
        'name': name,
        'description': description,
        'terms': terms,
        'drivers_number': driversNumber,
        'budget': budget,
        'km_price': kmPrice,
        'company_name': companyName,
        'duration': duration,
        'regions': regions,
        'centers': centers,
        'km_min': miniMum,
        'km_max': maxiMum,
      },
    );
  }
  /// Generic method to post data to the API and handle errors.
  
Future _postData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
    required List<String> photo, // ✅ نوعه List<String>
  }) async {
    final result = await Crud().post(
      url: url,
      body: body,
      isFormData: true,
      photo: photo,
      keyPhoto: 'images[]',
    );
    return result.fold((failure) => failure, (data) => fromJson(data));
  }
}
