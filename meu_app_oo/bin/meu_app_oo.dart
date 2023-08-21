import 'package:meu_app_oo/classes/Pessoa.dart';

void main(List<String> arguments) {
  var p1 = Pessoa("Danilo", "Rua 1");

  print(p1.getNome());
  print(p1.getEndereco());

  //sobrescrita
  print(p1);
}
