import 'package:flutter/material.dart';

class ShowSnackBarWidget {
  void validateString(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
      String field, String typeField) {
    if (field == '' || !field.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            'Preencha um $typeField válido.',
          ),
        ),
      );
      return;
    }
  }

  void validateDouble(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
      String? field, String typeField) {
    if (field == null || !field.contains(RegExp(r'^\d+(\.\d+)?$'))) {
      scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        content: Text('Preencha o campo $typeField adequadamente.'),
      ));
      return;
    }
  }
}
