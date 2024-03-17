import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/config.dart';
import 'package:zootopia/pages/login.dart';
import 'package:zootopia/shared/header.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

bool hidePassword = true;
String userPassword = '';
String confrimPassword = '';

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor("#283B71"),
            body: SingleChildScrollView(
              child: Column(children: [
                Header(
                  img: "assets/images/cover.jpeg",
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Reset Password',
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
                    'Please enter your new password',
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
                    'New Password',
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
                  onChange: (value) {
                    setState(() {
                      userPassword = value;
                    });
                  },
                  initialValue: "",
                  obscureText: hidePassword,
                  borderFocusColor: Colors.white,
                  prefixIconColor: Colors.white.withOpacity(0.7),
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  hintColor: Colors.white,
                  borderRadius: 10,
                  prefixIcon: const Icon(Icons.lock),
                  showPrefixIcon: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Colors.white.withOpacity(0.7),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormHelper.inputFieldWidget(
                  context,
                  "Confirm Password",
                  "Confirm Password",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return 'Password can\'t be empty.';
                    }

                    return null;
                  },
                  (onSavedVal) => {
                    confrimPassword = onSavedVal,
                  },
                  onChange: (value) {
                    setState(() {
                      confrimPassword = value;
                    });
                  },
                  initialValue: "",
                  obscureText: hidePassword,
                  borderFocusColor: Colors.white,
                  prefixIconColor: Colors.white.withOpacity(0.7),
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  hintColor: Colors.white,
                  borderRadius: 10,
                  prefixIcon: const Icon(Icons.lock),
                  showPrefixIcon: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Colors.white.withOpacity(0.7),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FormHelper.submitButton(
                  'Confirm',
                  () {
                    if (userPassword != confrimPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'Password doesn\'t match, Please try again')));
                    } else if (userPassword.isEmpty ||
                        confrimPassword.isEmpty) {
                      try {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Please enter the password ')));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                'Password doesn\'t match, Please try again')));
                      }
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Your Password Changed Successfully!",
                        "OK",
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     backgroundColor: Colors.green,
                      //     content: Text('Password match,')));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Login(),
                      //     ));
                    }
                  },
                  width: 300,
                  btnColor: HexColor("283B71"),
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 10,
                ),
              ]),
            )));
  }
}
