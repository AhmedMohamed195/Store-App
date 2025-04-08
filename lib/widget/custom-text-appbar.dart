import 'package:flutter/material.dart';

class CustomTextAppBarHome extends StatelessWidget {
  const CustomTextAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Store ',
            style: TextStyle(
              color: Colors.red, // برتقالي محترق
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          TextSpan(
            text: 'App',
            style: TextStyle(
              color: Colors.orange, // بني شوكولاتة
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
