// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:zootopia/Core/Errors/error_model.dart';

class DioServerException implements Exception {
  final DioErrorModel errModel;

  DioServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw DioServerException(
          errModel: DioErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw DioServerException(
              errModel: DioErrorModel.fromJson(e.response!.data));
      }
  }
}
