// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:zootopia/Core/API/end_points.dart';

class SigninModel {
  //define variables of response
  final String message;
  final String token;
  SigninModel({
    required this.message,
    required this.token,
  });

  factory SigninModel.fromJson(Map<String, dynamic> jsonData) {
    return SigninModel(message: ApiKey.message, token: ApiKey.token);
  }
}
