// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormFieldThree extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final void Function(String)? onchanged;

  const CustomTextFormFieldThree(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      required this.onchanged});

  @override
  State<CustomTextFormFieldThree> createState() =>
      _CustomTextFormFieldTwoState();
}

class _CustomTextFormFieldTwoState extends State<CustomTextFormFieldThree> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
 double screenheight = MediaQuery.of(context).size.height;
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenheight*0.02),
      child: TextFormField(
        onChanged: widget.onchanged,
        controller: widget.mycontroller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenheight*0.02,
            horizontal: screenWidth * 0.04,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: widget.hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: screenWidth*0.002),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
