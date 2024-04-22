import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/config.dart';
import 'package:zootopia/pages/Authentication/login.dart';
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
            backgroundColor: const Color.fromRGBO(250, 192, 113, 1),
            body: SingleChildScrollView(
              child: Column(children: [
                Header(
                  img: "assets/images/cover.jpeg",
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Reset Password',
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
                    'Please enter your new password',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: Text(
                    'New Password',
                    style: TextStyle(
                        color: HexColor("#00347D"),
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
                    }
                  },
                  width: 300,
                  btnColor: HexColor("#00347D"),
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 10,
                ),
              ]),
            )));
  }
}
