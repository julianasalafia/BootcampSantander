import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text == newValue.text) {
      return newValue;
    }

    String nValue = newValue.text.replaceAll('-', '');
    String sub = nValue.substring(0, nValue.length > 5 ? 5 : nValue.length);
    if (nValue.length > 5) {
      sub += '-${nValue.substring(5)}';
    }

    if (nValue.length > 8) {
      return oldValue;
    }

    return newValue.copyWith(
        text: sub, selection: TextSelection.collapsed(offset: sub.length));
  }
}
