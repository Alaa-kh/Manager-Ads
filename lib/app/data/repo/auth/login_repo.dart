
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

   Future _postData({
    required String url,
    required Function fromJson,
    required Map<String, String> body,
  }) async {
    try {
      final result = await Crud().post(url: url, body: body);
      return result.fold((failure) => failure, (data) {
        if (data.containsKey('message') && !(data.containsKey('data'))) {
          // هذا معناه فشل من السيرفر برسالة واضحة
          return Failures(errMessage: data['message']);
        } else if (data.containsKey('message') &&
            (data.containsKey('data') && data['data']['role'] != 'ادمن')) {
          return Failures(
            errMessage: 'لا يمكنك تسجيل الدخول هذا الحساب غير صالح',
          );
        }
        return fromJson(data);
      });
    } catch (e) {
      print('Exception in _postData:::::::::::::::; $e');
      return Failures(errMessage: 'An error occurred');
    }
  }
}
