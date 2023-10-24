import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 50.0, left: 50.0, top: 50.0, bottom: 80.0),
      child: Image.asset(logoImage),
    );
  }
}
