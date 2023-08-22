import 'dart:convert';
import 'dart:io';

import 'package:meu_app_exceptions/models/aluno.dart';
import 'package:meu_app_exceptions/models/console_utils.dart';

void execute() {
  stdout.write('bem vindo ao sistema de notas! \n');
  String nome = ConsoleUtils.lerStringComTexto('digite o nome do aluno: ');
  var aluno = Aluno(nome);
}
