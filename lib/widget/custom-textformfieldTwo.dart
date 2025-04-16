// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormFieldTwo extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextFormFieldTwo({
    super.key,
    required this.hinttext,
    required this.mycontroller,
  });

  @override
  State<CustomTextFormFieldTwo> createState() => _CustomTextFormFieldTwoState();
}

class _CustomTextFormFieldTwoState extends State<CustomTextFormFieldTwo> {
  bool _isObscured = true;

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
        obscureText: _isObscured,
        controller: widget.mycontroller,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle password visibility
              });
            },
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          hintText: widget.hinttext,
          hintStyle: TextStyle(fontSize: fontSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
