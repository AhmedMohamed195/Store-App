import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color? color;
  final FontWeight fontweight;
  final String alignment;
  const CustomText(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.color,
      required this.fontweight,
      required this.alignment});
  AlignmentGeometry getAlignmentFromString() {
    switch (alignment.toLowerCase()) {
      case "topleft":
        return Alignment.topLeft;
      case "topcenter":
        return Alignment.topCenter;
      case "topright":
        return Alignment.topRight;
      case "centerleft":
        return Alignment.centerLeft;
      case "center":
        return Alignment.center;
      case "centerright":
        return Alignment.centerRight;
      case "bottomleft":
        return Alignment.bottomLeft;
      case "bottomcenter":
        return Alignment.bottomCenter;
      case "bottomright":
        return Alignment.bottomRight;
      default:
        return Alignment.centerLeft; // Default to centerLeft if invalid string
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      alignment: getAlignmentFromString(),
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontsize, color: color, fontWeight: fontweight),
      ),
    );
  }
}
