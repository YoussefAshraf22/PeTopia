// this file for API services and handle endpoints
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zootopia/config.dart';
import 'package:zootopia/models/login_request_model.dart';
import 'package:zootopia/models/login_response_model.dart';
import 'package:zootopia/models/regisrter_response.dart';
import 'package:zootopia/models/register_request_model.dart';
import 'package:zootopia/services/shared_service.dart';


class APIService {
  //make client cervices
  static var client = http.Client();

  //login request method
  static Future<bool> login(LoginRequestModel model) async {
    //map of string to get login request header
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    //to get authority url of login endpoint
    var url = Uri.http(Config.apiURL, Config.loginAPI);
    // to send HTTP POST request with the given headers and body to the given URL.
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    //when login successfully
    if (response.statusCode == 200) {
      //store the information
      //shared services
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      return false;
    }
  }

  //register request method
  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    //map of string to get login request header
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    //to get authority url of login endpoint
    var url = Uri.http(
      Config.apiURL,
      Config.registerAPI,
    );
    // to send HTTP POST request with the given headers and body to the given URL.
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }
}
