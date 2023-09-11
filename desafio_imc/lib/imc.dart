import 'package:desafio_imc/pessoa.dart';

class IMC extends Pessoa {
  double? _imc;

  IMC(Pessoa pessoa) : super(pessoa.nome, pessoa.peso, pessoa.altura) {
    _imc = calculateIMC(pessoa.peso, pessoa.altura);
  }

  double? get imc => _imc;

  set imc(double? imc) {
    _imc = imc!;
  }

  double calculateIMC(double? peso, double? altura) {
    double alturaEmMetros = altura! / 100;
    return peso! / (alturaEmMetros! * alturaEmMetros);
  }

  @override
  String toString() {
    return 'IMC: $_imc';
  }
}
