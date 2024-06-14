import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zootopia/pages/Authentication/forget_password_page.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
        ),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.blueGrey, fontSize: 14.0),
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
    );
  }
}
