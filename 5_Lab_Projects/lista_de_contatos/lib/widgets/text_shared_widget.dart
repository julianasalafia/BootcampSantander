import 'package:flutter/material.dart';

class TextSharedWidget extends StatelessWidget {
  String title = '';
  double fontSize = 24;
  FontWeight fontWeight;
  Color color;

  TextSharedWidget(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.color,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextSharedWidget titleApp(String title) {
    return TextSharedWidget(
      title: title,
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextSharedWidget textApp(String title) {
    return TextSharedWidget(
      title: title,
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    );
  }
}
