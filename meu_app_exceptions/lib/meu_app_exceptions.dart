import 'dart:convert';
import 'dart:io';

import 'package:meu_app_exceptions/models/aluno.dart';
import 'package:meu_app_exceptions/models/console_utils.dart';

void execute() {
  stdout.write('bem vindo ao sistema de notas! \n');
  String nome = ConsoleUtils.lerStringComTexto('digite o nome do aluno: ');
  var aluno = Aluno(nome);
  double? nota;

  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        'Digite a nota ou S para sair: ', 'S');
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  stdout.write(
      'As notas digitadas foram: ${aluno.getNotas()} \nA média do aluno foi ${aluno.retornaMedia()}. ');

  if (aluno.aprovado(7)) {
    stdout.write('O aluno ${aluno.getNome()} foi aprovado.');
  } else {
    stdout.write('O aluno ${aluno.getNome()} foi reprovado.');
  }
}
