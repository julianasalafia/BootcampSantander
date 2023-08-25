import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
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
        onPressed: widget.onPressed,
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
