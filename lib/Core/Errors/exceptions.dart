

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'dart:convert';

class ErrorModel {
  final String message;

  ErrorModel({required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
    );
  }
}

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleHttpException(http.Response response) {
  switch (response.statusCode) {
    case 400: // Bad request
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 401: // Unauthorized
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 403: // Forbidden
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 404: // Not found
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 409: // Conflict
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 422: // Unprocessable Entity
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    case 504: // Gateway Timeout
      throw ServerException(
          errModel: ErrorModel.fromJson(jsonDecode(response.body)));
    default:
      throw ServerException(
          errModel:
              ErrorModel(message: 'Unexpected error: ${response.statusCode}'));
  }
}
