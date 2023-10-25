import 'package:flutter/material.dart';

class TextSharedWidget extends StatelessWidget {
  String title = '';
  double fontSize = 24;
  FontWeight? fontWeight;
  Color? color;

  TextSharedWidget({
    super.key,
    required this.title,
    required this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
