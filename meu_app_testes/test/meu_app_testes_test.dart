import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('calcula o desconto do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('calcula o desconto do produto com desconto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });
}
