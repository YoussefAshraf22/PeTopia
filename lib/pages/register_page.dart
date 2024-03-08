import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/config.dart';
import 'package:zootopia/models/register_request_model.dart';
import 'package:zootopia/services/api_service.dart';
import 'package:zootopia/shared/header.dart';
import 'package:zootopia/shared/line.dart';
import 'package:zootopia/shared/social_bottons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//to overshowing when click on the login bottom
  bool isAPICallProcess = false;
  //for hiding the password
  bool hidePassword = true;
  //global key for maintain the form state 'save,rest and validate'
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? userPassword;
  String? email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            img: "assets/images/cover.jpeg",
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              'SignUp',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "Username",
            "Username",
            (onValidate) {
              if (onValidate.isEmpty) {
                return 'Username can\'t be empty';
              } else {
                return null;
              }
            },
            (onSaved) {
              userName = onSaved;
            },
            prefixIcon: const Icon(
              Icons.person,
            ),
            showPrefixIcon: true,
            initialValue: "",
            obscureText: false,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white.withOpacity(0.6),
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 8,
          ),
          FormHelper.inputFieldWidget(
            context,
            "Email",
            "Email",
            (onValidate) {
              if (onValidate.isEmpty) {
                return 'Email can\'t be empty';
              } else {
                return null;
              }
            },
            (onSaved) {
              email = onSaved;
            },
            prefixIcon: const Icon(
              Icons.email,
            ),
            showPrefixIcon: true,
            initialValue: "",
            obscureText: false,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white.withOpacity(0.6),
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 8,
          ),
          FormHelper.inputFieldWidget(
            context,
            "Password",
            "Password",
            (onValidate) {
              if (onValidate.isEmpty) {
                return 'Password can\'t be empty';
              } else {
                return null;
              }
            },
            (onSaved) {
              userPassword = onSaved;
            },
            prefixIcon: const Icon(Icons.lock),
            showPrefixIcon: true,
            initialValue: "",
            obscureText: hidePassword,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white.withOpacity(0.7),
                )),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white.withOpacity(0.6),
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: FormHelper.submitButton('Register', () {
              //to start our loader
              if (validateAndSava()) {
                setState(() {
                  isAPICallProcess = true;
                });
                //create model file login
                RegisterRequestModel model = RegisterRequestModel(
                    username: userName, password: userPassword, email: email);
                //call API service
                APIService.register(model).then((response) {
                  setState(() {
                    isAPICallProcess = false;
                  });
                  if (response.data != null) {
                    //when successfully login will remove all routes and navigate to home page
                    FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Registration Successful. Please login to the account",
                        'Ok', () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    });
                  } else {
                    FormHelper.showSimpleAlertDialog(
                        context, Config.appName, response.message, 'Ok', () {
                      Navigator.of(context).pop();
                    });
                  }
                });
              }
            },
                borderColor: Colors.white,
                borderRadius: 10,
                btnColor: HexColor('#283B71'),
                width: 300),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    text: 'Have oleardy an account? ',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    children: [
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        })
                ])),
          ),
          const Line(),
          const SocialBottons()
        ],
      ),
    );
  }

  //method for validation
  bool validateAndSava() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
