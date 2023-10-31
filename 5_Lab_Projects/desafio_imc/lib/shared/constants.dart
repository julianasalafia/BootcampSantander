import 'package:flutter/material.dart';

import 'app_colors.dart';

const height = 10.0;
const width = 15.0;

const homePage = '/';
const resultsPage = '/resultados';
const singlePersonResultPage = '/dadospessoa';

const kTextTitleStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 80.0,
  color: AppColors.rosaDuo,
);

const kListTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: AppColors.vinho,
);

const kTextStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 25.0,
  color: AppColors.vinho,
);

const kResultTextStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 30.0,
  color: AppColors.rosaTrio,
);

const kTextTitleResultStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 50.0,
  color: AppColors.rosaDuo,
);

TextStyle kResultTextStyleBorderStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 30.0,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..color = AppColors.vinho,
);

TextStyle kTextTitleResultBorderStyle = TextStyle(
  fontFamily: 'Modak',
  fontSize: 50.0,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = AppColors.vinho,
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

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
  );
}
