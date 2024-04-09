import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/Authentication/forget_password_page.dart';
import 'package:zootopia/pages/Authentication/reset_password_page.dart';
import 'package:zootopia/shared/Verification_input.dart';
import 'package:zootopia/shared/header.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 192, 113, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                img: "assets/images/cover.jpeg",
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Verification Code',
                  style: TextStyle(
                      color: HexColor("#00347D"),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Please enter the verification code sent to your email. \n If the verification code doesn\'t send, click resend ',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerificationInput(),
                  VerificationInput(),
                  VerificationInput(),
                  VerificationInput(),
                  VerificationInput(),
                  VerificationInput(),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: FormHelper.submitButton(
                        'Verify',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResetPassword(),
                              ));
                        },
                        width: 300,
                        btnColor: HexColor("#00347D"),
                        borderColor: Colors.white,
                        txtColor: Colors.white,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: FormHelper.submitButton(
                        'Resend',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ));
                        },
                        width: 300,
                        btnColor: HexColor("#00347D"),
                        borderColor: Colors.white,
                        txtColor: Colors.white,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
