import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
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
      return left(
        Failures(errMessage: 'An error occurred'),
      );
    }
  }

  //* Performs a POST request.
  //* Returns either a Map<String, dynamic> response or a Failures object in case of an error.
  Future<Either<Failures, Map<String, dynamic>>> post({
    required final String url,
    required final Map<String, dynamic> body,
    final bool isFormData = false,
    final String? photo,
    final String? keyPhoto,
  }) async {
    // try {
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
        )
      ]);

      final Response response;

      // Performing POST request based on form data or JSON body
      if (isFormData) {
        FormData data = FormData.fromMap({
          if (photo != null) keyPhoto!: await MultipartFile.fromFile(photo),
          ...body,
        });
        response = await _dio.post(url, data: data);
      } else {
        response = await _dio.post(url, data: body);
      }

      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return right(responseData);
    // } catch (e) {
    //   // Handling DioException errors
    //   if (e is DioException) {
    //     if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
    //       // Unauthorized: Clear authentication state
    //       _box.remove(AppKey.verify);
    //       final Map<String, dynamic> response =
    //           e.response!.data as Map<String, dynamic>;
    //       return left(
    //         Failures(
    //           errMessage: response['msg'] as String,
    //           data: response['data'],
    //         ),
    //       );
    //     } else if ([400, 422, 404, 403, 325].contains(e.response?.statusCode)) {
    //       // Handling specific error statuses: Extract and return error message and data from response
    //       final Map<String, dynamic> response =
    //           e.response!.data as Map<String, dynamic>;
    //       return left(
    //         Failures(
    //           errMessage: response['msg'] as String,
    //           data: response['data'],
    //         ),
    //       );
    //     } else if (e.response?.statusCode == 409) {
    //       final Map<String, dynamic> response =
    //           e.response!.data as Map<String, dynamic>;
    //       return left(
    //         Failures(
    //           errMessage: response['error'] as String,
    //           data: response['data'],
    //         ),
    //       );
    //     }
    //     // Other DioException types: Convert to FailuresServer
    //     return left(FailuresServer.fromDioException(exType: e.type));
    //   }
    //   // Handling other exceptions
    //   return left(
    //     Failures(errMessage: 'An error occurred, try again'),
    //   );
    // }
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
        )
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
      return left(
        Failures(errMessage: 'An error occurred, try again'),
      );
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
        )
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
      return left(
        Failures(errMessage: 'An error occurred, try again'),
      );
    }
  }



  Future<Either<Failures, Map<String, dynamic>>> patch({
    required final String url,
    required final Map<String, dynamic> body,
    final bool isFormData = false,
    final String? photo,
    final String? keyPhoto,
  }) async {
    // إعداد الهيدر
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
                    responseData?['error'] ??
                    'An error occurred')
                .toString();

        final dynamic errorData = responseData?['data'];

        if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
          _box.remove(AppKey.verify);
          return left(Failures(errMessage: errorMsg, data: errorData));
        } else if ([
          400,
          422,
          404,
          403,
          325,
          409,
        ].contains(e.response?.statusCode)) {
          return left(Failures(errMessage: errorMsg, data: errorData));
        }

        return left(FailuresServer.fromDioException(exType: e.type));
      }

      return left(Failures(errMessage: 'An unknown error occurred'));
    }
  }

}
