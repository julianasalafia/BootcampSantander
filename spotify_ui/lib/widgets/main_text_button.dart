import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class MainTextButton extends StatelessWidget {
  const MainTextButton({
    super.key,
    required this.title,
    required this.width,
  });

  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: TextButton(
          onPressed: () {},
          child: Text(
            title,
            style: kMainButtonTextStyle,
          )),
    );
  }
}
