import 'package:flutter/material.dart';

class InfoTextFieldWidget extends StatelessWidget {
  final String hint;

  const InfoTextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.person_outline),
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
