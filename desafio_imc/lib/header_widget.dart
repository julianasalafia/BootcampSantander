import 'package:desafio_imc/shared/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String logo = 'assets/images/hello-kitty.png';
    const String title = 'IMC';

    return Row(
      children: [
        Image.asset(
          logo,
          scale: 1.5,
        ),
        Stack(
          children: [
            Text(
              title,
              style: kBorderTitleStyle,
            ),
            const Text(
              title,
              style: kTextTitleStyle,
            ),
          ],
        ),
      ],
    );
  }
}
