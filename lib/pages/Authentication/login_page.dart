import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/config.dart';
import 'package:zootopia/models/login_request_model.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/services/api_service.dart';
import 'package:zootopia/shared/header.dart';
import 'package:zootopia/shared/line.dart';
import 'package:zootopia/shared/social_bottons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //to overshowing when click on the login bottom
  bool isAPICallProcess = false;
  //for hiding the password
  bool hidePassword = true;
  //global key for maintain the form state
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? userPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //using snippet_coder_utils package
      backgroundColor: HexColor("#283B71"),
      body: ProgressHUD(
        //check from the API call
        inAsyncCall: isAPICallProcess,
        //to match the same key
        key: UniqueKey(),
        opacity: 0.3,
        child: Form(
          child: _loginUi(context),
        ),
      ),
    ));
  }

//wedgit for creat login UI
  Widget _loginUi(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(
            img: "assets/images/cover.jpeg",
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //add the username field
          FormHelper.inputFieldWidget(context, "Username", "User name",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return 'User name can\'t be empty';
            }
            return null;
          }, (onSaved) => {userName = onSaved},
              borderFocusColor: Colors.white,
              borderColor: Colors.white,
              hintColor: Colors.white,
              prefixIcon: const Icon(Icons.person),
              borderRadius: 10,
              prefixIconColor: Colors.white.withOpacity(0.6),
              showPrefixIcon: true),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "Password",
            "Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Password can\'t be empty';
              }
              return null;
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
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 2,
            widthFactor: 3,
            child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Forget Password',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                      //to make click event on the text
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Forget Password');
                        })
                ])),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Login",
              () {
                if (validateAndSava()) {
                  setState(() {
                    isAPICallProcess = true;
                  });

                  LoginRequestModel model = LoginRequestModel(
                    username: userName,
                    password: userPassword,
                  );

                  APIService.login(model).then(
                    (response) {
                      setState(() {
                        isAPICallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Invalid Username/Password !!",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: HexColor("283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
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
