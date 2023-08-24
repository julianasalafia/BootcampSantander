import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('calcula o desconto do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test(
      'calcula o desconto do produto com desconto sem porcentagem passando valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('calcula o desconto do produto com desconto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('calcula o desconto do produto com desconto zerado com porcentagem', () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });
}
