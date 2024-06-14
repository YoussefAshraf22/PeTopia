import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/Cubit/user_cubit.dart';
import 'package:zootopia/Cubit/user_state.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/pages/home_page.dart';
import 'package:zootopia/shared/header.dart';
import 'package:zootopia/shared/line.dart';
import 'package:zootopia/shared/social_bottons.dart';
import 'package:zootopia/widgets/custom_form_button.dart';
import 'package:zootopia/widgets/custom_input_field.dart';
import 'package:zootopia/widgets/forget_password_widget.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(250, 192, 113, 1),
            //using Bloc statemanagment
            body:
                BlocConsumer<UserCubit, UserState>(listener: (context, state) {
              if (state is SignInSuccessed) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Center(child: Text('Login Successed 😸')),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2)));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              } else if (state is SignInFailure) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Center(child: Text('Login Faild 😿')),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2)));
              }
            }, builder: (context, state) {
              return (SingleChildScrollView(
                  child: Form(
                key: context.read<UserCubit>().signInFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Header(
                        img: "assets/images/cover.jpeg",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 30, top: 50),
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: HexColor("#00347D"),
                          ),
                        ),
                      ),

                      Center(
                        child: CustomInputField(
                          prefixIcon: Icons.email,
                          labelText: 'Email',
                          hintText: 'Enter Your email',
                          controller: context.read<UserCubit>().signInEmail,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: CustomInputField(
                          prefixIcon: Icons.lock,
                          labelText: 'Password',
                          hintText: 'Enter Your password',
                          obscureText: true,
                          suffixIcon: true,
                          controller: context.read<UserCubit>().signInPassword,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const ForgetPasswordWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      //!Sign In Button
                      state is SignInLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Center(
                              child: CustomFormButton(
                                innerText: 'LogIn',
                                onPressed: () {
                                  context.read<UserCubit>().signIn();
                                },
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            )),
                        child: const Center(
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),

                      const Line(),
                      const SocialBottons()
                    ]),
              )));
            })));
  }
}
