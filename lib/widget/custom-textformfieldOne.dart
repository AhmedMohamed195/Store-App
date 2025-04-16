import 'package:flutter/material.dart';

class CustomTextFormFieldOne extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  const CustomTextFormFieldOne({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double fontSize = screenWidth * 0.045;

    fontSize = fontSize.clamp(14, 20);

    double verticalPadding = screenHeight * 0.02;
    double horizontalPadding = screenWidth * 0.04;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.012,
      ),
      child: TextFormField(
        validator: validator,
        controller: mycontroller,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: fontSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
