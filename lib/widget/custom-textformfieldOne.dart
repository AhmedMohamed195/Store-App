// ignore_for_file: prefer_const_constructors

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
