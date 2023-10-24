import 'package:flutter/material.dart';
import 'package:via_cep/core/formatter/cep_input_formatter.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final CepInputFormatter? cepInputFormatter;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.cepInputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: cepInputFormatter != null ? [cepInputFormatter!] : [],
      keyboardType: cepInputFormatter != null ? TextInputType.number : null,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: label),
    );
  }
}
