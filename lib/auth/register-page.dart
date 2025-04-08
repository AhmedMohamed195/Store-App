// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:store_app/widget/custom-butn.dart';
import 'package:store_app/widget/custom-logo.dart';
import 'package:store_app/widget/custom-text.dart';
import 'package:store_app/widget/custom-textformfieldOne.dart';
import 'package:store_app/widget/custom-textformfieldTwo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
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
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              //Custom Logo :-
              CustomLogo(imagePath: "lib/images/register.png"),
              SizedBox(
                height: 15,
              ),
              //Custom Text :-
              CustomText(
                text: "Register",
                fontsize: 30,
                color: Colors.white,
                fontweight: FontWeight.bold,
                alignment: "center",
              ),

              SizedBox(
                height: 10,
              ),
              //Custom Text :-
              CustomText(
                text: "UserName",
                fontsize: 20,
                color: Colors.white,
                fontweight: FontWeight.normal,
                alignment: "centerleft",
              ),
             
              //Custom CustomTextFormField name :-
              CustomTextFormFieldOne(
                hinttext: "Enter your name",
                mycontroller: name,
                validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  return null;
                },
              ),
              CustomText(
                text: "Email",
                fontsize: 20,
                color: Colors.white,
                fontweight: FontWeight.normal,
                alignment: "centerleft",
              ),
             
              //Custom CustomTextFormField email :-

              CustomTextFormFieldOne(
                hinttext: "Enter your email",
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
                text: "Password",
                fontsize: 20,
                color: Colors.white,
                fontweight: FontWeight.normal,
                alignment: "centerleft",
              ),
              // CustomTextFormField password :-
              CustomTextFormFieldTwo(
                hinttext: "Enter password",
                mycontroller: password,
              ),
              //Custom Text :-
             
              SizedBox(
                height: 20,
              ),
              //Custom Button :-
              CustomButton(
                color: Colors.deepOrange.shade700,
                text: "Register ",
                fontSize: 20,
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("loginpage", (route) => false);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The password provided is too weak..',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The account already exists for that email.',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),

              SizedBox(
                height: 5,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: " Have An Account ?", style: TextStyle(fontSize: 16)),
                TextSpan(
                    text: " Login",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacementNamed("loginpage");
                      }),
              ])),
            ],
          ),
        ]),
      ),
    );
  }
}
