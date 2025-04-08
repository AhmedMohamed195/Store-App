import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final String? image; // Made image optional

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
    return SizedBox(
      height: 50,
      width: 300,
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
                height: 24, // Adjust image size
                width: 24,
              ),
              SizedBox(width: 10), // Space between image and text
            ],
            Text(
              text,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
