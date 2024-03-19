import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/Authentication/otp_page.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/shared/header.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

String? email;

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                img: "assets/images/cover.jpeg",
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Enter your email and we will send you a link\n to reset your password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 180),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FormHelper.inputFieldWidget(
                  context,
                  'Enter your email',
                  'Enter your email',
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return 'Username can\'t be empty.';
                    }

                    return null;
                  },
                  (onSavedVal) {},
                  onChange: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  initialValue: "",
                  obscureText: false,
                  borderFocusColor: Colors.white,
                  prefixIconColor: Colors.white.withOpacity(0.7),
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  hintColor: Colors.white,
                  borderRadius: 10,
                  prefixIcon: const Icon(Icons.email),
                  showPrefixIcon: true),
              const SizedBox(
                height: 30,
              ),
              FormHelper.submitButton(
                'Send',
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPForm(),
                      ));
                },
                width: 300,
                btnColor: HexColor("283B71"),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                        children: [
                      TextSpan(
                          text: 'SignUp',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
