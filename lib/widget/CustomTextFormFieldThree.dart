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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: TextFormField(
        onChanged: widget.onchanged,
        controller: widget.mycontroller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: widget.hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
