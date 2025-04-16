// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/auth/login-page.dart';
import 'package:store_app/cubit/cubit_product/product_cubit.dart';
import 'package:store_app/screens/home-page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        if (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => ProductCubit()..getProducts(),
                      child: HomePage(),
                    )),
          );
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.10;
    fontSize = fontSize.clamp(28, 60);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Store ',
                style: TextStyle(
                  color: Color(0xFFBF360C),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize, 
                ),
              ),
              TextSpan(
                text: 'App',
                style: TextStyle(
                  color: Color(0xFFFFA726),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
