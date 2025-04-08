// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo or Image
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/store_logo.png'), // Replace with your logo
            ),
            const SizedBox(height: 16),

            // Store Name
            const Text(
              "My Store",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Company Description
            const Text(
              "Welcome to My Store – your one-stop destination for quality products at unbeatable prices. "
              "We’re passionate about delivering excellent service and hand-picked items to meet your needs.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 24),

            // Mission Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Mission",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "To provide a seamless shopping experience with top-notch customer service and the best selection of products.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 24),

            // Vision Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Vision",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "To be the most customer-centric online store, where people can find and discover anything they want to buy.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 24),

            // Contact Info
          ],
        ),
      ),
    );
  }
}
