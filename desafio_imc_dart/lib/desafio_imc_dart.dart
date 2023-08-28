import 'dart:io';

import 'package:desafio_imc_dart/models/console_utils.dart';

void execute() {
  stdout.write('\n\n====== bem vindo a calculadora IMC! ====== \n\n');
  String nome = ConsoleUtils.lerString('Qual seu nome? ');
  double? peso = ConsoleUtils.lerDouble('Qual seu peso? ');
  double? altura = ConsoleUtils.lerDouble('Qual sua altura? ');

  print('$nome, $peso, $altura');
}
