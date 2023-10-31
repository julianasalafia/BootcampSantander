import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
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
}
