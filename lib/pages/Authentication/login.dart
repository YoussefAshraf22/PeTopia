import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/config.dart';
import 'package:zootopia/models/login_request_model.dart';
import 'package:zootopia/pages/Authentication/forget_password_page.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/services/api_service.dart';
import 'package:zootopia/shared/header.dart';
import 'package:zootopia/shared/line.dart';
import 'package:zootopia/shared/social_bottons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //to overshowing when click on the login bottom
  bool isAPICallProcess = false;
  //for hiding the password
  bool hidePassword = true;
  //global key for maintain the form state
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? userPassword;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 192, 113, 1),
        body: ProgressHUD(
          //check from the API call
          inAsyncCall: isAPICallProcess,
          // opacity: 0.3,
          //to match the same key
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(
            img: "assets/images/cover.jpeg",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: HexColor("#00347D"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(context, "Username", "Username",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Username can\'t be empty.';
              }

              return null;
            },
                (onSavedVal) => {
                      userName = onSavedVal,
                    },
                initialValue: "",
                obscureText: false,
                borderFocusColor: HexColor("#00347D"),
                prefixIconColor: HexColor("#00347D"),
                borderColor: HexColor("#00347D"),
                textColor: HexColor("#00347D"),
                hintColor: HexColor("#00347D"),
                borderRadius: 10,
                prefixIcon: const Icon(Icons.person),
                showPrefixIcon: true),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "Password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                userPassword = onSavedVal,
              },
              initialValue: "",
              obscureText: hidePassword,
              borderFocusColor: HexColor("#00347D"),
              prefixIconColor: HexColor("#00347D"),
              borderColor: HexColor("#00347D"),
              textColor: HexColor("#00347D"),
              hintColor: HexColor("#00347D"),
              borderRadius: 10,
              prefixIcon: const Icon(Icons.lock),
              showPrefixIcon: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: HexColor("#00347D"),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: RichText(
                text: TextSpan(
                  style:
                      const TextStyle(color: Colors.blueGrey, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Forget Password ?',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: FormHelper.submitButton('Login', () {
              Navigator.pushNamed(context, '/home');
            },
                btnColor: HexColor("#00347D"),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10,
                width: 300),
          ),
          // Center(
          //   child: FormHelper.submitButton("Login", () {
          //     if (validateAndSave()) {
          //       setState(() {
          //         isAPICallProcess = true;
          //       });

          //       LoginRequestModel model = LoginRequestModel(
          //         username: userName,
          //         password: userPassword,
          //       );

          //       APIService.login(model).then(
          //         (response) {
          //           setState(() {
          //             isAPICallProcess = false;
          //           });

          //           if (response) {
          //             Navigator.pushNamedAndRemoveUntil(
          //               context,
          //               '/home',
          //               (route) => false,
          //             );
          //           } else {
          //             FormHelper.showSimpleAlertDialog(
          //               context,
          //               Config.appName,
          //               "Invalid Username/Password !!",
          //               "OK",
          //               () {
          //                 Navigator.of(context).pop();
          //               },
          //             );
          //           }
          //         },
          //       );
          //     }
          //   },
          //       btnColor: HexColor("#00347D"),
          //       borderColor: Colors.white,
          //       txtColor: Colors.white,
          //       borderRadius: 10,
          //       width: 300),
          // ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 16),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'SignUp',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      //to make click event on the text
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ));
                        })
                ])),
          ),
          const Line(),
          const SocialBottons()
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  
}
