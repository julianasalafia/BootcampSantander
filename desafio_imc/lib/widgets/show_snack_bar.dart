import 'package:flutter/material.dart';

class ShowSnackBarWidget {
  void validateString(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
      String field, String typeField) {
    if (field == '' || !field.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        content: Text('Preencha um $typeField válido.'),
      ));
      return;
    }
  }

  void validateDouble(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
      double? field, String typeField) {
    if (field == null) {
      scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        content: Text('Preencha o campo $typeField adequadamente.'),
      ));
      return;
    }
  }
}
