
import 'package:manager_ads/app/core/constants/app_api.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/auth/login_model.dart';
import 'package:manager_ads/app/data/network/crud.dart';

abstract class LoginRepository {
  Future login({
    required String name,
    required String password,
  });
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future login({
    required String name,
    required String password,
  }) async {
    return _postData(
      url: AppApi.login,
      fromJson: (json) => LoginModel.fromJson(json),
      body: {
        'username': name,
        'password': password,
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
