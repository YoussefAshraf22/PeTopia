// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:zootopia/Core/API/end_points.dart';

class DioErrorModel {
  final int status;
  final String errorMessage;

  DioErrorModel({required this.status, required this.errorMessage});
  factory DioErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return DioErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}
