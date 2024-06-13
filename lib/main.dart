import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/Core/API/dio_consumer.dart';
import 'package:zootopia/Cubit/user_cubit.dart';
import 'package:zootopia/pages/Authentication/login.dart';
import 'package:zootopia/pages/Authentication/login2.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/pages/home_page.dart';
import 'package:zootopia/pages/profile/profile_state.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => UserCubit(DioConsumer(dio: Dio())),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileState(),
      child: MaterialApp(
        title: 'Petopia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#00347D")),
          useMaterial3: true,
        ),

        //add routing routes for navigation pages
        routes: {
          //start with the home page
          '/': (context) => const Login2(),
          '/home': (context) => const HomePage(),
          '/login': (context) => const Login(),
          '/register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
