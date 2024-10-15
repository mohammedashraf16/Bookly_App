import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("BadCertificate with api server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to api server was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet connection!");
      case DioExceptionType.unknown:
        return ServerFailure("Opps There was an error, please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if(statusCode == 404){
      return ServerFailure("Your request was not found, please try later");
    }else if(statusCode==500){
      return ServerFailure("Internal Server Error, please try again later");
    }else if(statusCode == 400||statusCode == 401||statusCode == 403){
      return ServerFailure(response["error"]["message"]);
    }else{
      return ServerFailure("There was an error, please try again");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
