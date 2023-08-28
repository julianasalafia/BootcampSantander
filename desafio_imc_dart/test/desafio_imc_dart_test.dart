import 'package:desafio_imc_dart/classes/pessoa.dart';
import 'package:desafio_imc_dart/desafio_imc_dart.dart';
import 'package:test/test.dart';

void main() {
  test('calcula o imc e retorna o valor correto', () {
    Pessoa pessoa = Pessoa('Test', 70, 170);
    double imc = calculaIMC(pessoa);
    expect(imc, closeTo(24.22, 0.01));
  });

  test('retorna categoria correta', () {
    expect(getCategoria(15), equals('Magreza Grave'));
    expect(getCategoria(16.5), equals('Magreza Moderada'));
    expect(getCategoria(18), equals('Magreza Leve'));
    expect(getCategoria(22), equals('Saudável'));
    expect(getCategoria(27), equals('Sobrepeso'));
    expect(getCategoria(32), equals('Obesidade Grau I'));
    expect(getCategoria(37), equals('Obesidade Grau II'));
    expect(getCategoria(42), equals('Obesidade Grau III'));
  });
}
