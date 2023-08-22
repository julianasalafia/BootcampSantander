import 'dart:convert';
import 'dart:io';

import 'package:meu_app_exceptions/meu_app_exceptions.dart'
    as meu_app_exceptions;

void main(List<String> arguments) {
  stdout.write('digite um número: ');
  var line = stdin.readLineSync(encoding: utf8);

  try {
    double numero = double.parse(line ?? "");
    print(numero);
  } catch (e) {
    print("numero inválido: $line");
  } finally {
    print('executando finally');
  }
}
