
// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final String? image;

  const CustomButton({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; 
    final screenHeight = MediaQuery.of(context).size.height; 

    double buttonWidth = screenWidth * 0.75;
    double buttonHeight = screenHeight * 0.065; 
    double adjustedFontSize = (screenWidth * 0.045).clamp(14, 22); 
    double imageSize = screenWidth * 0.06; 
    double spacing = screenWidth * 0.02;

    return SizedBox(
      height: buttonHeight, 
      width: buttonWidth, 
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null && image!.isNotEmpty) ...[
              Image.asset(
                image!,
                height: imageSize, 
                width: imageSize, 
              ),
              SizedBox(width: spacing), 
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: adjustedFontSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
