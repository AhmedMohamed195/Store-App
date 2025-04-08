// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormFieldTwo extends StatefulWidget {
   final String hinttext;
  final TextEditingController mycontroller;
 
  const CustomTextFormFieldTwo({super.key, required this.hinttext, required this.mycontroller});

  @override
  State<CustomTextFormFieldTwo> createState() => _CustomTextFormFieldTwoState();
}

class _CustomTextFormFieldTwoState extends State<CustomTextFormFieldTwo> {
   bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
      obscureText: _isObscured,
        controller: widget.mycontroller,
      
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          suffixIcon: IconButton(onPressed:(){setState(() {
             _isObscured = !_isObscured; // Toggle password visibility
          });} , icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          hintText: widget.hinttext,
          // contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}