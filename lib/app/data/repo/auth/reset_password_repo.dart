
import 'package:dartz/dartz.dart';
import 'package:manager_ads/app/core/constants/app_api.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/models/auth/reset_password_model.dart';
import 'package:manager_ads/app/data/network/crud.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failures, ResetPasswordModel>> resetPassword({
    required String password,
    required String confirmPassword,
    required String code,
  });
}

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  @override
  Future<Either<Failures, ResetPasswordModel>> resetPassword({
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    return _postData<ResetPasswordModel>(
      url: AppApi.resetPassword,
      fromJson: (json) => ResetPasswordModel.fromJson(json),
      body: {
        'password': password,
        'password_confirmation': confirmPassword,
        'code': code,
      },
    );
  }

  Future<Either<Failures, T>> _postData<T>({
    required String url,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, String> body,
  }) async {
    try {
      final result = await Crud().patch(url: url, body: body);
      return result.fold(
        (failure) => left(failure),
        (data) => right(fromJson(data)),
      );
    } catch (e) {
      return left(Failures(errMessage: 'An exception occurred: $e'));
    }
  }
}
