import 'package:flutter/material.dart';

class InfoTextFieldWidget extends StatelessWidget {
  final String hint;
  final Icon icon;

  const InfoTextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), labelText: hint)),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
