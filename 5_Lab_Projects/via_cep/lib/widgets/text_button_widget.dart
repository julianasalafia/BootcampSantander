import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../shared/app_colors.dart';
import '../utils/constants.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: widget.onPageChanged,
        child: const Text(
          registerCepMessage,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
