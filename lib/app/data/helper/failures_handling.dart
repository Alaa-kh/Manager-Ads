
import 'package:dio/dio.dart';

class Failures {
  final String errMessage;
  final dynamic data;
  Failures({
    required this.errMessage,
    this.data,
  });
}

/// Represents a failure related to server communication, extending the base [Failures] class.
class FailuresServer extends Failures {
  /// Constructs a [FailuresServer] instance with an error message.
  FailuresServer({
    required super.errMessage,
    super.data,
  });

  /// Factory method to create a [FailuresServer] instance from a [DioException].
  factory FailuresServer.fromDioException({
    required DioExceptionType exType,
  }) {
    switch (exType) {
      case DioExceptionType.connectionTimeout:
        return FailuresServer(errMessage: 'Connection timed out');
      case DioExceptionType.sendTimeout:
        return FailuresServer(errMessage: 'Transmission timed out');
      case DioExceptionType.receiveTimeout:
        return FailuresServer(errMessage: 'Receipt timeout has expired');
      case DioExceptionType.badCertificate:
        return FailuresServer(errMessage: 'Bad testimony');
      case DioExceptionType.badResponse:
        return FailuresServer(errMessage: 'unavailable!');
      case DioExceptionType.cancel:
        return FailuresServer(errMessage: 'canceled');
      case DioExceptionType.connectionError:
        return FailuresServer(errMessage: 'connection error');
      case DioExceptionType.unknown:
        return FailuresServer(errMessage: 'unknown');
    }
  }
}
