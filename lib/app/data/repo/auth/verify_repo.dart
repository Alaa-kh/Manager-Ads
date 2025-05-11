import 'package:manager_ads/app/core/constants/app_api.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/auth/verify_model.dart';
import 'package:manager_ads/app/data/network/crud.dart';

abstract class VerifyRepository {
  Future verify({required String code});
}

class VerifyRepositoryImpl extends VerifyRepository {
  @override
  Future verify({required String code}) async {
    return _patchData(
      url: AppApi.verify,
      fromJson: (json) => VerifyModel.fromJson(json),
      body: {'code': code},
    );
  }

  /// Generic method to post data to the API and handle errors.
  Future _patchData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
  }) async {
    try {
      final result = await Crud().patch(url: url, body: body);
      return result.fold((failure) => failure, (data) => fromJson(data));
    } catch (e) {
      print('Exception in _postData:::::::::::::::; $e');
      return Failures(errMessage: 'An error occurred');
    }
  }
}
