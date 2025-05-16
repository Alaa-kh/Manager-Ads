import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:manager_ads/app/core/constants/app_key.dart';
import 'package:manager_ads/app/data/helper/failures_handling.dart';
import 'package:manager_ads/app/data/services/app_services.dart';

//* Class for performing CRUD operations using Dio HTTP client.
class Crud {
  GetStorage get _box => Get.find<MyServices>().getBox;
  final Dio _dio = Dio();

  //* Performs a GET request.
  //* Returns either a Map<String, dynamic> response or a Failures object in case of an error.
  Future<Either<Failures, Map<String, dynamic>>> get({
    required final String url,
    final CancelToken? cancelToken,
  }) async {
    try {
      // Setting up Dio options
      _dio.options.headers['content-Type'] = 'application/json';
      if (_box.read(AppKey.token) != null) {
        _dio.options.headers["Authorization"] =
            "Bearer ${_box.read(AppKey.token)}";
      }

      _dio.options.connectTimeout = const Duration(seconds: 3);
      _dio.options.receiveTimeout = const Duration(seconds: 3);
      _dio.options.responseType = ResponseType.json;

      // Performing GET request
      Response response = await _dio.get(url, cancelToken: cancelToken);
      dynamic jsonResponse = response.data;
      print(response);

      // Handling response based on type (List or Map)
      if (jsonResponse is List) {
        return right({"data": jsonResponse});
      }
      return right(jsonResponse);
    } catch (e) {
      // Handling DioException errors
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          // Unauthorized: Clear authentication state
          _box.remove(AppKey.verify);
          return left(Failures(errMessage: e.response.toString()));
        } else if (e.response?.statusCode == 422) {
          // Unprocessable Entity: Extract and return error message from response
          Map response = jsonDecode(e.response.toString());
          return left(Failures(errMessage: response['message']));
        }
        // Other DioException types: Convert to FailuresServer
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      // Handling other exceptions
      return left(Failures(errMessage: 'An error occurred'));
    }
  }

  //* Performs a POST request.
  //* Returns either a Map<String, dynamic> response or a Failures object in case of an error.
Future<Either<Failures, Map<String, dynamic>>> post({
    required final String url,
    required final Map<String, dynamic> body,
    final bool isFormData = false,
    final Object? photo,
    final String? keyPhoto,
  }) async {
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.options.headers['Accept'] = 'application/json';
      _dio.options.headers['Transfer-Encoding'] = 'chunked';

      if (_box.read(AppKey.token) != null) {
        _dio.options.headers["Authorization"] =
            "Bearer ${_box.read(AppKey.token)}";
      }

      _dio.options.connectTimeout = const Duration(seconds: 15);
      _dio.options.receiveTimeout = const Duration(seconds: 15);
      _dio.options.responseType = ResponseType.json;

      _dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      ]);

      final Response response;

      if (isFormData) {
        List<MultipartFile> files = [];
        if (photo != null && photo is List<String> && keyPhoto != null) {
          for (final path in photo) {
            final file = await MultipartFile.fromFile(
              path,
              filename: path.split("/").last,
            );
            files.add(file);
          }
        }

        final Map<String, dynamic> formMap = {
          ...body,
          if (files.isNotEmpty) keyPhoto!: files,
        };

        FormData data = FormData.fromMap(formMap);
        response = await _dio.post(url, data: data);
      } else {
        response = await _dio.post(url, data: body);
      }

      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;
      return right(responseData);
    } on DioError catch (dioError) {
      if (dioError.response != null &&
          dioError.response!.data != null &&
          dioError.response!.data is Map<String, dynamic>) {
        final data = dioError.response!.data as Map<String, dynamic>;
        String errorMessage = 'Unknown error occurred';

        if (data.containsKey('message') && data['message'] is String) {
          errorMessage = data['message'];
        } else if (data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is List) {
            errorMessage = errors.map((e) => '• $e').join('\n'); // ✅ شكل قائمة
          } else if (errors is String) {
            errorMessage = errors;
          }
        }

        return left(Failures(errMessage: errorMessage));
      } else {
        return left(Failures(errMessage: dioError.message.toString()));
      }
    } catch (e) {
      return left(Failures(errMessage: 'Something went wrong'));
    }
  }



  // //* Performs a POST request.
  // //* Returns either a Map<String, dynamic> response or a Failures object in case of an error.
  // Future<Either<Failures, Map<String, dynamic>>> put({
  //   required final String url,
  //   required final Map<String, dynamic> body,
  //   final bool isFormData = false,
  //   final String? photo,
  // }) async {
  //   try {
  //     // Setting up Dio options
  //     _dio.options.headers['Content-Type'] = 'multipart/form-data';
  //     _dio.options.headers['Accept'] = 'application/json';
  //     _dio.options.headers['Transfer-Encoding'] = 'chunked';

  //     if (_box.read(AppKey.token) != null) {
  //       _dio.options.headers["Authorization"] =
  //           "Bearer ${_box.read(AppKey.token)}";
  //     }

  //     _dio.options.connectTimeout = const Duration(seconds: 15);
  //     _dio.options.receiveTimeout = const Duration(seconds: 15);
  //     _dio.options.responseType = ResponseType.json;

  //     // Adding logging interceptor
  //     _dio.interceptors.addAll([
  //       LogInterceptor(
  //         request: true,
  //         requestBody: true,
  //         requestHeader: true,
  //         responseBody: true,
  //         responseHeader: true,
  //       )
  //     ]);

  //     final Response response;

  //     // Performing PUT request based on form data or JSON body
  //     if (isFormData) {
  //       FormData data = FormData.fromMap({
  //         if (photo != null)
  //           "patient_photo": await MultipartFile.fromFile(photo),
  //         ...body,
  //       });
  //       response = await _dio.put(url, data: data);
  //     } else {
  //       response = await _dio.put(url, data: body);
  //     }

  //     final Map<String, dynamic> responseData =
  //         response.data as Map<String, dynamic>;

  //     return right(responseData);
  //   } catch (e) {
  //     // Handling DioException errors
  //     if (e is DioException) {
  //       if (e.response?.statusCode == 401) {
  //         // Unauthorized: Clear authentication state
  //         _box.remove(AppKey.verify);
  //         final Map<String, dynamic> response =
  //             e.response!.data as Map<String, dynamic>;
  //         return left(
  //           Failures(
  //             errMessage: response['message'] as String,
  //             data: response['data'],
  //           ),
  //         );
  //       } else if ([422, 404, 403].contains(e.response?.statusCode)) {
  //         // Handling specific error statuses: Extract and return error message and data from response
  //         final Map<String, dynamic> response =
  //             e.response!.data as Map<String, dynamic>;
  //         return left(
  //           Failures(
  //             errMessage: response['message'] as String,
  //             data: response['data'],
  //           ),
  //         );
  //       }
  //       // Other DioException types: Convert to FailuresServer
  //       return left(FailuresServer.fromDioException(exType: e.type));
  //     }
  //     // Handling other exceptions
  //     return left(
  //       Failures(errMessage: 'An error occurred, try again'),
  //     );
  //   }
  // }

  //* Performs a POST request.
  //* Returns either a Map<String, dynamic> response or a Failures object in case of an error.
  Future<Either<Failures, Map<String, dynamic>>> delete({
    required final String url,
    required final Map<String, dynamic>? body,
    final bool isFormData = false,
    final String? photo,
  }) async {
    try {
      // Setting up Dio options
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.options.headers['Accept'] = 'application/json';
      _dio.options.headers['Transfer-Encoding'] = 'chunked';

      if (_box.read(AppKey.verify) == 'true') {
        _dio.options.headers["Authorization"] =
            "Bearer ${_box.read(AppKey.token)}";
      }

      _dio.options.connectTimeout = const Duration(seconds: 15);
      _dio.options.receiveTimeout = const Duration(seconds: 15);
      _dio.options.responseType = ResponseType.json;

      // Adding logging interceptor
      _dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      ]);

      final Response response;

      // Performing POST request based on form data or JSON body
      if (isFormData) {
        FormData data = FormData.fromMap({
          if (photo != null) "photo": await MultipartFile.fromFile(photo),
          ...body ?? {},
        });
        response = await _dio.delete(url, data: data);
      } else {
        response = await _dio.delete(url, data: body);
      }

      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return right(responseData);
    } catch (e) {
      // Handling DioException errors
      if (e is DioException) {
        if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
          // Unauthorized: Clear authentication state
          _box.remove(AppKey.verify);
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['message'] as String,
              data: response['data'],
            ),
          );
        } else if ([400, 422, 404, 403].contains(e.response?.statusCode)) {
          // Handling specific error statuses: Extract and return error message and data from response
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['msg'] as String,
              data: response['data'],
            ),
          );
        } else if (e.response?.statusCode == 409) {
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['error'] as String,
              data: response['data'],
            ),
          );
        }
        // Other DioException types: Convert to FailuresServer
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      // Handling other exceptions
      return left(Failures(errMessage: 'An error occurred, try again'));
    }
  }

  Future<Either<Failures, Map<String, dynamic>>> put({
    required final String url,
    required final Map<String, dynamic> body,
    final bool isFormData = false,
    final String? photo,
    final String? keyPhoto,
  }) async {
    try {
      // Setting up Dio options
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.options.headers['Accept'] = 'application/json';
      _dio.options.headers['Transfer-Encoding'] = 'chunked';

      if (_box.read(AppKey.token) != null) {
        _dio.options.headers["Authorization"] =
            "Bearer ${_box.read(AppKey.token)}";
      }

      _dio.options.connectTimeout = const Duration(seconds: 15);
      _dio.options.receiveTimeout = const Duration(seconds: 15);
      _dio.options.responseType = ResponseType.json;

      // Adding logging interceptor
      _dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      ]);

      final Response response;

      // Performing POST request based on form data or JSON body
      if (isFormData) {
        FormData data = FormData.fromMap({
          if (photo != null) keyPhoto!: await MultipartFile.fromFile(photo),
          ...body,
        });
        response = await _dio.put(url, data: data);
      } else {
        response = await _dio.put(url, data: body);
      }

      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return right(responseData);
    } catch (e) {
      // Handling DioException errors
      if (e is DioException) {
        if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
          // Unauthorized: Clear authentication state
          _box.remove(AppKey.verify);
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['msg'] as String,
              data: response['data'],
            ),
          );
        } else if ([400, 422, 404, 403, 325].contains(e.response?.statusCode)) {
          // Handling specific error statuses: Extract and return error message and data from response
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['msg'] as String,
              data: response['data'],
            ),
          );
        } else if (e.response?.statusCode == 409) {
          final Map<String, dynamic> response =
              e.response!.data as Map<String, dynamic>;
          return left(
            Failures(
              errMessage: response['error'] as String,
              data: response['data'],
            ),
          );
        }
        // Other DioException types: Convert to FailuresServer
        return left(FailuresServer.fromDioException(exType: e.type));
      }
      // Handling other exceptions
      return left(Failures(errMessage: 'An error occurred, try again'));
    }
  }

  Future<Either<Failures, Map<String, dynamic>>> patch({
    required final String url,
    required final Map<String, dynamic> body,
    final bool isFormData = false,
    final String? photo,
    final String? keyPhoto,
  }) async {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    print(body);
    if (_box.read(AppKey.token) != null) {
      _dio.options.headers["Authorization"] =
          "Bearer ${_box.read(AppKey.token)}";
    }

    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.options.responseType = ResponseType.json;

    try {
      final Response response;

      if (isFormData) {
        FormData data = FormData.fromMap({
          if (photo != null) keyPhoto!: await MultipartFile.fromFile(photo),
          ...body,
        });
        response = await _dio.patch(url, data: data);
      } else {
        response = await _dio.patch(url, data: body);
      }

      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return right(responseData);
    } catch (e) {
      if (e is DioException) {
        final Map<String, dynamic>? responseData =
            e.response?.data as Map<String, dynamic>?;

        final String errorMsg =
            (responseData?['message'] ??
                    responseData?['errors'] ??
                    'An error occurred')
                .toString();

        final dynamic errorData = responseData?['data'];

        return left(Failures(errMessage: errorMsg, data: errorData));
      }

      return left(Failures(errMessage: 'An unknown error occurred'));
    }
  }
}
