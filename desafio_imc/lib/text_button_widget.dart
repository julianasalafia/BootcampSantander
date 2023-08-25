import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: AppColors.rosaDuo,
        border: Border.all(color: AppColors.vinho, width: 3),
      ),
      child: TextButton(
        onPressed: () {},
        child: Stack(
          children: [
            Text(
              'CALCULAR',
              style: kBorderTextStyle,
            ),
            const Text(
              'CALCULAR',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Modak', fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
