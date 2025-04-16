// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/cubit/cubit_register/register_cubit.dart';
import 'package:store_app/screens/drawer/about-us-page.dart';
import 'package:store_app/screens/drawer/contact-us-page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String userName = '';
  String userEmail = '';

  getName() async {
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    String username = userData['userName'];
    String useremail = userData['email'];

    if (mounted) {
      setState(() {
        userName = username;
        userEmail = useremail;
      });
    }
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final avatarRadius = screenWidth * 0.08;
    final paddingTop = screenHeight * 0.09;
    final spacingBelowHeader = screenHeight * 0.09;
    final fontSizeTitle = screenWidth * 0.06;
    final fontSizeSubtitle = screenWidth * 0.036;

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, paddingTop, 16, 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: avatarRadius,
                    child: Text(
                      'S_A',
                      style: TextStyle(
                        fontSize: avatarRadius * 0.9,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello $userName",
                          style: TextStyle(
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.04),
                        Text(
                          userEmail,
                          style: TextStyle(
                            fontSize: fontSizeSubtitle,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacingBelowHeader),
            buildTile(context, icon: Icons.home, text: 'Home', onTap: () {
              Navigator.of(context).pop();
            }),
            buildTile(context, icon: Icons.phone, text: 'Contact Us',
                onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ContactUsPage()),
              );
            }),
            buildTile(context, icon: Icons.info, text: 'About Us', onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AboutUsPage()),
              );
            }),
            buildTile(context, icon: Icons.logout, text: 'Log Out',
                onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                "loginpage",
                (route) => false,
              );
            }),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Store ',
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      children: [
                        TextSpan(
                          text: 'App',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Flutter E-commerce App using REST API',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.036,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ],
        ),
      ),
    );
  }

  Widget buildTile(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      leading: Icon(icon, size: screenWidth * 0.08),
      title: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.050,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
