import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zootopia/Core/API/api_consummer.dart';
import 'package:zootopia/Core/API/end_points.dart';
import 'package:zootopia/Core/Errors/exceptions.dart';

class LoggingInterceptor {
  void logRequest(http.Request request) {
    print('Request: ${request.method} ${request.url}');
    print('Request headers: ${request.headers}');
    if (request.method != 'GET') {
      print('Request body: ${request.body}');
    }
  }

  void logResponse(http.Response response) {
    print('Response status: ${response.statusCode}');
    print('Response headers: ${response.headers}');
    print('Response body: ${response.body}');
  }
}

class HttpConsumer extends ApiConsumer {
  final http.Client client;
  final LoggingInterceptor loggingInterceptor;

  HttpConsumer({required this.client, required this.loggingInterceptor});

  Future<dynamic> _handleRequest(
      Future<http.Response> Function() request) async {
    try {
      final response = await request();
      loggingInterceptor.logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      throw ServerException(
        errModel: ErrorModel(message: 'Failed to make the request: $e'),
      );
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      handleHttpException(response);
    }
  }

  void handleHttpException(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 401:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 403:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 404:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 409:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 422:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      case 504:
        throw ServerException(
            errModel: ErrorModel.fromJson(jsonDecode(response.body)));
      default:
        throw ServerException(
          errModel:
              ErrorModel(message: 'Unexpected error: ${response.statusCode}'),
        );
    }
  }

  @override
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final url = Uri.parse('${EndPoint.baseUrl}$path')
        .replace(queryParameters: queryParameters);
    final request = http.Request('GET', url)..headers.addAll(_headers());

    loggingInterceptor.logRequest(request);

    return _handleRequest(
        () => client.send(request).then(http.Response.fromStream));
  }

  @override
  Future<dynamic> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) async {
    final url = Uri.parse('${EndPoint.baseUrl}$path')
        .replace(queryParameters: queryParameters);
    final request = http.Request('POST', url)
      ..headers.addAll(_headers())
      ..body = jsonEncode(data);

    loggingInterceptor.logRequest(request);

    return _handleRequest(
        () => client.send(request).then(http.Response.fromStream));
  }

  @override
  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) async {
    final url = Uri.parse('${EndPoint.baseUrl}$path')
        .replace(queryParameters: queryParameters);
    final request = http.Request('PATCH', url)
      ..headers.addAll(_headers())
      ..body = jsonEncode(data);

    loggingInterceptor.logRequest(request);

    return _handleRequest(
        () => client.send(request).then(http.Response.fromStream));
  }

  @override
  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) async {
    final url = Uri.parse('${EndPoint.baseUrl}$path')
        .replace(queryParameters: queryParameters);
    final request = http.Request('DELETE', url)
      ..headers.addAll(_headers())
      ..body = jsonEncode(data);

    loggingInterceptor.logRequest(request);

    return _handleRequest(
        () => client.send(request).then(http.Response.fromStream));
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
