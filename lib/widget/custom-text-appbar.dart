import 'package:flutter/material.dart';

class CustomTextAppBarHome extends StatelessWidget {
  const CustomTextAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.07;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Store ',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: 'App',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
