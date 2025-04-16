// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:store_app/cubit/cubit_register/register_cubit.dart';
import 'package:store_app/widget/custom-butn.dart';
import 'package:store_app/widget/custom-logo.dart';
import 'package:store_app/widget/custom-text.dart';
import 'package:store_app/widget/custom-textformfieldOne.dart';
import 'package:store_app/widget/custom-textformfieldTwo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double topPadding = screenHeight * 0.07;
    double titleFontSize = (screenWidth * 0.08).clamp(24, 34);
    double labelFontSize = (screenWidth * 0.05).clamp(16, 22);
    double textFontSize = (screenWidth * 0.045).clamp(14, 18);

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("loginpage", (route) => false);
          } else if (state is RegisterError) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: state.errorMessage,
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueGrey.shade800,
                    Colors.orange.shade300,
                  ],
                ),
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: topPadding),
                      Center(
                        child: CustomLogo(imagePath: "lib/images/register.png"),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Center(
                        child: CustomText(
                          text: "Register",
                          fontsize: titleFontSize,
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          alignment: "center",
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      CustomText(
                        text: "UserName",
                        fontsize: labelFontSize,
                        color: Colors.white,
                        fontweight: FontWeight.normal,
                        alignment: "centerleft",
                      ),
                      CustomTextFormFieldOne(
                        hinttext: "Enter your name",
                        mycontroller: name,
                        validator: (val) {
                          if (val == "") return "Can't be empty";
                          return null;
                        },
                      ),
                      CustomText(
                        text: "Email",
                        fontsize: labelFontSize,
                        color: Colors.white,
                        fontweight: FontWeight.normal,
                        alignment: "centerleft",
                      ),
                      CustomTextFormFieldOne(
                        hinttext: "Enter your email",
                        mycontroller: email,
                        validator: (val) {
                          if (val == "") return "Can't be empty";
                          return null;
                        },
                      ),
                      CustomText(
                        text: "Password",
                        fontsize: labelFontSize,
                        color: Colors.white,
                        fontweight: FontWeight.normal,
                        alignment: "centerleft",
                      ),
                      CustomTextFormFieldTwo(
                        hinttext: "Enter password",
                        mycontroller: password,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Center(
                        child: state is RegisterLoading
                            ? CircularProgressIndicator()
                            : CustomButton(
                                color: Colors.deepOrange.shade700,
                                text: "Register",
                                fontSize: textFontSize,
                                onPressed: () {
                                  context.read<RegisterCubit>().registerUser(
                                        email: email.text,
                                        password: password.text,
                                        name: name.text,
                                      );
                                },
                              ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Have An Account?",
                                style: TextStyle(fontSize: textFontSize),
                              ),
                              TextSpan(
                                text: " Login",
                                style: TextStyle(
                                    fontSize: textFontSize + 2,
                                    color: Colors.red),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("loginpage");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
