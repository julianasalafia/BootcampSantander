import 'dart:io';

import 'package:desafio_imc_dart/classes/pessoa.dart';
import 'package:desafio_imc_dart/models/console_utils.dart';

void execute() {
  stdout.write('\n\n====== bem vindo a calculadora IMC! ====== \n\n');
  String nome = ConsoleUtils.lerString('Qual seu nome? ');
  double? peso = ConsoleUtils.lerDouble('Qual seu peso? ');
  double? altura = ConsoleUtils.lerDouble('Qual sua altura em cm? ');

  Pessoa pessoa = Pessoa(nome, peso, altura);
  pessoa.setNome(nome);
  pessoa.setPeso(peso);
  pessoa.setAltura(altura);

  double imc = calculaIMC(pessoa);
  String categoria = getCategoria(imc);
  print(
      '\n\n====== Olá ${pessoa.getNome()} ====== \n\nIMC: ${imc.toStringAsFixed(1)} \nCategoria: $categoria. \n\n=========================\n\n');
}

double calculaIMC(Pessoa pessoa) {
  double? alturaMetros = pessoa.getAltura();

  alturaMetros /= 100;
  return pessoa.getPeso() / (alturaMetros * alturaMetros);
}

String getCategoria(double imc) {
  if (imc < 16) {
    return 'Magreza Grave';
  } else if (imc < 17) {
    return 'Magreza Moderada';
  } else if (imc < 18.5) {
    return 'Magreza Leve';
  } else if (imc < 25) {
    return 'Saudável';
  } else if (imc < 30) {
    return 'Sobrepeso';
  } else if (imc < 35) {
    return 'Obesidade Grau I';
  } else if (imc < 40) {
    return 'Obesidade Grau II';
  } else {
    return 'Obesidade Grau III';
  }
}
