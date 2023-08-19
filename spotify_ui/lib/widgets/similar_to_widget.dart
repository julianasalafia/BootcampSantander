import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class SimilarToWidget extends StatelessWidget {
  const SimilarToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.asset(
            'assets/images/aishadeecover.jpeg',
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PARECIDO COM',
              style: TextStyle(color: AppColors.mediumGrey, fontSize: 12.0),
            ),
            SizedBox(height: 3.0),
            Text(
              'Aisha Dee',
              style: kTitleTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
