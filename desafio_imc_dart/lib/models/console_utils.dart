import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerString(String texto) {
    stdout.write(texto);
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble(String texto) {
    var valor = lerString(texto);

    try {
      return double.parse(valor);
    } catch (e) {
      return null;
    }
  }
}
