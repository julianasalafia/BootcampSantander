import 'package:flutter/material.dart';

import 'app_colors.dart';

enum CategoriaIMC {
  magrezaGrave,
  magrezaModerada,
  magrezaLeve,
  saudavel,
  sobrepeso,
  obesidadeGrauI,
  obesidadeGrauII,
  obesidadeGrauIII
}

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

TextField buildTextField(
    {required TextEditingController controller, required String hintText}) {
  return TextField(
    controller: controller,
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
