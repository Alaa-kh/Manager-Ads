import 'dart:convert';

import 'package:manager_ads/app/core/constants/app_api.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/add_campaing_model.dart';
import 'package:manager_ads/app/data/network/crud.dart';

abstract class AddCampaingRepository {
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
    required List<String> images,
  });
}

class AddCampaingRepositoryImpl extends AddCampaingRepository {
  @override
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
    required List<String> images,
  }) async {
    return _postData(
      url: AppApi.addAds,
      fromJson: (json) => AddCampaingModel.fromJson(json),
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
        'images': jsonEncode(images),
      },
    );
  }

  /// Generic method to post data to the API and handle errors.
  Future _postData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
  }) async {
    try {
      final result = await Crud().post(url: url, body: body);
      return result.fold((failure) => failure, (data) => fromJson(data));
    } catch (e) {
      print('Exception in _postData:::::::::::::::; $e');
      return Failures(errMessage: 'An error occurred');
    }
  }
}
