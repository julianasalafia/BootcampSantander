import 'package:meu_app_oo/classes/Pessoa.dart';
import 'package:meu_app_oo/classes/PessoaFisica.dart';
import 'package:meu_app_oo/classes/PessoaJuridica.dart';

void main(List<String> arguments) {
  var p1 = Pessoa("Danilo", "Rua 1");

  print(p1.getNome());
  print(p1.getEndereco());

  //sobrescrita
  print(p1);

  // herança
  var pessoaFisica1 = PessoaFisica("Danilo", "Rua 1", "000.000.000-00");
  print(pessoaFisica1);

  var pessoaJuridica1 =
      PessoaJuridica("Empresa 1", "Rua 2", "000.0000.0001/00");
  print(pessoaJuridica1);
}
