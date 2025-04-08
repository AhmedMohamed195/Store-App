// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLogo extends StatelessWidget {
  final String imagePath;
  const CustomLogo({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
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
