import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String ler(String texto) {
    stdout.write(texto);
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerString(String texto) {
    String valor;

    do {
      String input = ler(texto);
      valor = input;

      if (!valor.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
        print('Error: Por favor, digite um nome válido.');
      }
    } while (!valor.contains(RegExp(r'^[a-zA-Z\s]+$')));

    return valor;
  }

  static double lerDouble(String texto) {
    double? valor;

    while (true) {
      String? input = ler(texto);
      valor = double.tryParse(input);

      if (valor != null && valor >= 0) {
        return valor;
      } else {
        print('Erro: por favor, digite um número válido.');
      }
    }
  }
}
