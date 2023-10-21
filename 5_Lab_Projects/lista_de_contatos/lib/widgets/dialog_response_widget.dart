import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../helper/constants.dart';

class DialogResponseWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? cancelButtonText;
  final Function onPressed;

  const DialogResponseWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.cancelButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text(cancelButtonText ?? voidMessage),
        ),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: const Text(confirmButton),
        ),
      ],
    );
  }
}
