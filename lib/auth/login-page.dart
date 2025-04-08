// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, unused_local_variable, unnecessary_null_comparison

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit/product_cubit.dart';
import 'package:store_app/widget/custom-butn.dart';
import 'package:store_app/widget/custom-logo.dart';
import 'package:store_app/widget/custom-text.dart';
import 'package:store_app/widget/custom-textformfieldOne.dart';
import 'package:store_app/widget/custom-textformfieldTwo.dart';
import 'package:store_app/screens/home-page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key1 = GlobalKey();

  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key1,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blueGrey.shade800,
                  Colors.orange.shade300,
                ]),
          ),
          child: ListView(children: [
            Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                //Custom Logo :-
                CustomLogo(imagePath: "lib/images/login.png"),
                SizedBox(
                  height: 15,
                ),
                //Custom Text :-
                CustomText(
                  text: "Login",
                  fontsize: 30,
                  color: Colors.white,
                  fontweight: FontWeight.bold,
                  alignment: "center",
                ),

                SizedBox(
                  height: 15,
                ),
                //Custom Text :-
                CustomText(
                  alignment: "centerleft",
                  text: "Email",
                  fontsize: 20,
                  color: Colors.white,
                  fontweight: FontWeight.normal,
                ),

                // CustomTextFormField with Email :-
                CustomTextFormFieldOne(
                  hinttext: "Enter your Email",
                  mycontroller: email,
                  validator: (val) {
                    if (val == "") {
                      return "Can't To be Empty";
                    }
                    return null;
                  },
                ),

                //Custom Text :-
                CustomText(
                  alignment: "centerleft",
                  text: "Password",
                  fontsize: 20,
                  color: Colors.white,
                  fontweight: FontWeight.normal,
                ),
                // CustomTextFormField with password :-
                CustomTextFormFieldTwo(
                    hinttext: "Enter password", mycontroller: password),

                //Custom Text :-
                InkWell(
                  onTap: () async {
                    if (email.text == "") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: "Please Enter Email Then press Forget Password",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Check Email',
                        desc: "Please Go TO Email To Make Reset Password",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    } catch (e) {
                      print(e);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: "Please Enter Right Email",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                  child: CustomText(
                    text: "Forget Password?",
                    fontsize: 16,
                    color: Colors.white,
                    fontweight: FontWeight.normal,
                    alignment: "centerright",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Custom Button Login:-
                CustomButton(
                  color: Colors.deepOrange.shade700,
                  text: "Login",
                  fontSize: 20,
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    if (key1.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                        //  لكى تمسح اللودنج عند تسجيل الدخول الصحيح
                        if (context.mounted) Navigator.of(context).pop();
                        if (FirebaseAuth.instance.currentUser!.emailVerified) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => BlocProvider(create:  (context) => ProductCubit()..getProducts(),
                            child: HomePage(),
                            )   ),
                            (Route<dynamic> route) =>
                                false, // This removes all previous routes
                          );
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: "Please Go TO Email TO Make Verified",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        }
                      } on FirebaseAuthException catch (e) {
                        //  لكى تمسح اللودنج عند تسجيل الدخول ويوجد ايرور
                        if (context.mounted) Navigator.of(context).pop();

                        // طباعة الخطأ في الكونسول لمعرفة الكود الفعلي
                        print("Error Code: ${e.code}");
                        print("Error Message: ${e.message}");

                        String errorMessage = "An unexpected error occurred.";

                        // التحقق من كود الخطأ وإظهار الرسالة المناسبة
                        if (e.code == 'user-not-found') {
                          errorMessage = "No user found for that email.";
                        } else if (e.code == 'wrong-password') {
                          errorMessage =
                              "Wrong password provided for that user.";
                        } else if (e.code == 'invalid-credential') {
                          errorMessage = "Invalid email or password.";
                        } else if (e.code == 'invalid-email') {
                          errorMessage = "Invalid email format.";
                        } else if (e.code == 'user-disabled') {
                          errorMessage = "This account has been disabled.";
                        } else if (e.code == 'too-many-requests') {
                          errorMessage = "Too many attempts. Try again later.";
                        }

                        if (context.mounted) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: errorMessage,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        }
                      } catch (e) {
                        //  لكى تمسح اللودنج عند تسجيل الدخول ويوجد ايرور
                        if (context.mounted) Navigator.of(context).pop();
                        print("Unexpected error: ${e.toString()}");
                      }
                    } else {
                      // لكى تمسح اللودنج
                      if (context.mounted) Navigator.of(context).pop();
                      print("Not Valid");
                    }
                  },
                ),

                SizedBox(
                  height: 15,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Dont have An Account ?",
                      style: TextStyle(fontSize: 16)),
                  TextSpan(
                      text: " Register",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed("registerpage");
                        }),
                ])),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////
