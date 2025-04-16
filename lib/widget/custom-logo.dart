// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLogo extends StatelessWidget {
  final String imagePath;
  const CustomLogo({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
        double heightSize = MediaQuery.of(context).size.height;

    return Container(
      width: widthSize*0.3,
      height: heightSize*0.15,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
