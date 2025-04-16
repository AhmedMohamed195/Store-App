
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit_login/login_cubit.dart';
import 'package:store_app/cubit/cubit_product/product_cubit.dart';
import 'package:store_app/widget/custom-butn.dart';
import 'package:store_app/widget/custom-logo.dart';
import 'package:store_app/widget/custom-text.dart';
import 'package:store_app/widget/custom-textformfieldOne.dart';
import 'package:store_app/widget/custom-textformfieldTwo.dart';
import 'package:store_app/screens/home-page.dart';
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

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; 
    final screenHeight = MediaQuery.of(context).size.height;
    double titleFontSize = screenWidth * 0.08;
    titleFontSize = titleFontSize.clamp(28, 50); 
    double labelFontSize = screenWidth * 0.05; 
    labelFontSize = labelFontSize.clamp(18, 30); 
    double buttonFontSize = screenWidth * 0.055; 
    buttonFontSize = buttonFontSize.clamp(18, 26);
    double verticalSpacing = screenHeight * 0.02; 

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is LoginSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ProductCubit()..getProducts(),
                  child: const HomePage(),
                ),
              ),
              (route) => false,
            );
          }

          if (state is ForgetPasswordSuccess) {
            Navigator.of(context).pop();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Check Email',
              desc: "Please go to your email to reset the password.",
              btnOkOnPress: () {},
            ).show();
          }

          if (state is LoginFailure) {
            Navigator.of(context).pop();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: state.error,
              btnOkOnPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);

          return Scaffold(
            body: Form(
              key: key1,
              child: Container(
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
                      children: [
                        SizedBox(height: screenHeight * 0.08), 
                        const CustomLogo(imagePath: "lib/images/login.png"),
                        SizedBox(height: verticalSpacing),
                        CustomText(
                          text: "Login",
                          fontsize: titleFontSize, 
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          alignment: "center",
                        ),
                        SizedBox(height: verticalSpacing), 
                        CustomText(
                          alignment: "centerleft",
                          text: "Email",
                          fontsize: labelFontSize, 
                          color: Colors.white,
                          fontweight: FontWeight.normal,
                        ),
                        CustomTextFormFieldOne(
                          hinttext: "Enter your Email",
                          mycontroller: email,
                          validator: (val) {
                            if (val == "") {
                              return "Can't be empty";
                            }
                            return null;
                          },
                        ),
                        CustomText(
                          alignment: "centerleft",
                          text: "Password",
                          fontsize: labelFontSize,
                          color: Colors.white,
                          fontweight: FontWeight.normal,
                        ),
                        CustomTextFormFieldTwo(
                          hinttext: "Enter password",
                          mycontroller: password,
                        ),
                        InkWell(
                          onTap: () {
                            if (email.text.isEmpty) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc:
                                    "Please enter your email before resetting.",
                                btnOkOnPress: () {},
                              ).show();
                            } else {
                              cubit.forgetPassword(email.text);
                            }
                          },
                          child: CustomText(
                            text: "Forget Password?",
                            fontsize: labelFontSize * 0.8, 
                            color: Colors.white,
                            fontweight: FontWeight.normal,
                            alignment: "centerright",
                          ),
                        ),
                        SizedBox(height: verticalSpacing), 
                        CustomButton(
                          color: Colors.deepOrange.shade700,
                          text: "Login",
                          fontSize: buttonFontSize,
                          onPressed: () {
                            if (key1.currentState!.validate()) {
                              cubit.login(email.text, password.text);
                            }
                          },
                        ),
                        SizedBox(height: verticalSpacing), 
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(fontSize: labelFontSize * 0.9), 
                              ),
                              TextSpan(
                                text: " Register",
                                style: TextStyle(
                                    fontSize: labelFontSize, 
                                    color: Colors.red),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed("registerpage");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
