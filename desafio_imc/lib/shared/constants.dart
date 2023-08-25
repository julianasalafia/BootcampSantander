import 'package:flutter/material.dart';

import 'app_colors.dart';

const height = 10.0;
const width = 15.0;

const kTextTitleStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 80.0,
  color: AppColors.rosaDuo,
);

const kTextStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 25.0,
  color: AppColors.vinho,
);

TextStyle kBorderTitleStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 80.0,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = AppColors.vinho,
);

TextStyle kBorderTextStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 25.0,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = AppColors.vinho,
);

TextField buildTextField({required String hintText}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      border: buildOutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: AppColors.rosaDuo, width: 4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: AppColors.rosaTrio, width: 4),
      ),
    ),
    textAlign: TextAlign.center,
  );
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
  );
}
