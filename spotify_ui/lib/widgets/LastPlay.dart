import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class LastPlay extends StatelessWidget {
  const LastPlay({
    super.key,
    required this.cover,
    required this.title,
  });

  final String cover;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
                child: Image.asset(cover)),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                style: kWidgetTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
