import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:zootopia/Core/API/api_consummer.dart';
import 'package:zootopia/Core/API/end_points.dart';
import 'package:zootopia/Core/Cache/cache_helper.dart';
import 'package:zootopia/Core/Errors/exceptions.dart';
import 'package:zootopia/Core/Errors/http_exceptions.dart';
import 'package:zootopia/Cubit/user_state.dart';
import 'package:zootopia/Model/signIn_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(InitialState());
  ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //password check
  bool hidePassword = true;
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  SigninModel? user;

  // method to get the login request
  // signIn() async {
  //   try {
  //     emit(SignInLoading());
  //     final response = await api.post(
  //         //path token
  //         EndPoint.signIn,
  //         data: {
  //           ApiKey.email = signInEmail.text,
  //           ApiKey.password = signInPassword.text
  //         },
  //         );
  //     emit(SignInSuccessed());
  //   } on DioServerException catch (e) {
  //     emit(SignInFailure(errMessage: e.errModel.errorMessage));
  //   }
  // }

  // Method to get the login request
  Future<void> signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          'email': signInEmail.text,
          'password': signInPassword.text,
        },
      );
           emit(SignInSuccessed());
      user = SigninModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(SignInFailure(errMessage: 'An unknown error occurred.'));
    }
  }
}
