// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.04;
    double titleFontSize = screenWidth * 0.067;
    double bodyFontSize = screenWidth * 0.046;
    double sectionTitleFontSize = screenWidth * 0.06;
    double avatarRadius = screenWidth * 0.16;
    double spacing = screenHeight * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleFontSize,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage:
                  AssetImage('lib/images/E-Commerce-App-photo2.webp'),
            ),
            SizedBox(height: spacing),
            Text(
              "My Store App",
              style: TextStyle(
                fontSize: sectionTitleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing * 0.8),
            Text(
              "Welcome to My Store – your one-stop destination for quality products at unbeatable prices. "
              "We’re passionate about delivering excellent service and hand-picked items to meet your needs.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: bodyFontSize,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing * 1.5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Mission",
                style: TextStyle(
                  fontSize: sectionTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: spacing * 0.5),
            Text(
              "To provide a seamless shopping experience with top-notch customer service and the best selection of products.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: bodyFontSize,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing * 1.5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Vision",
                style: TextStyle(
                  fontSize: sectionTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: spacing * 0.5),
            Text(
              "To be the most customer-centric online store, where people can find and discover anything they want to buy.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: bodyFontSize,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing * 1.5),
          ],
        ),
      ),
    );
  }
}
