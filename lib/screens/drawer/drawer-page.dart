// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/screens/drawer/about-us-page.dart';
import 'package:store_app/screens/drawer/contact-us-page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Row(
              children: [
                // صورة على الشمال
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/images/car.png'),
                ),
                SizedBox(width: 10),
                // كلمة store app
                Text(
                  'Store App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          // Contact Us
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
          // About Us
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          // Log Out
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                "loginpage",
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
