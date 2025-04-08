// ignore_for_file: prefer_const_constructors

import 'package:store_app/auth/login-page.dart';
import 'package:store_app/auth/register-page.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/screens/home-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/splashtest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "loginpage": (context) => LoginPage(),
        "registerpage": (context) => RegisterPage(),
        "homepage": (context) => HomePage(),
      },
      home: Scaffold(
        body: SplashPage()
      ),
    );
  }
}
