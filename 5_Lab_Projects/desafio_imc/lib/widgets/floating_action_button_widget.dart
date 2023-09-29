import 'package:flutter/material.dart';
import '../imc.dart';
import '../pessoa.dart';
import '../shared/app_colors.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  Map<Pessoa, IMC> setPessoasIMC = {};
  Widget page;

  FloatingActionButtonWidget({super.key, required this.page});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.rosaTrio,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.vinho),
            borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.open_in_full),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          );
        });
  }
}
