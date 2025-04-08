// ignore: file_name
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.frombadResponse(
            exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api server was canceled');
      case DioExceptionType.connectionError:
        if (exception.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Connection error with ApiServer');
      case DioExceptionType.unknown:
        return ServerFailure('unExpected error , please try again!');
      default:
        return ServerFailure('oops! Something went wrong, please try again!');
    }
  }

  factory ServerFailure.frombadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error , please try again!');
    } else {
      return ServerFailure('oops! Something went wrong, please try again!');
    }
  }
}