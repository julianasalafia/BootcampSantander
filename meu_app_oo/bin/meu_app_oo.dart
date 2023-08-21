import 'package:meu_app_oo/classes/pessoa_fisica.dart';
import 'package:meu_app_oo/classes/pessoa_juridica.dart';

void main(List<String> arguments) {
  var pessoaFisica1 = PessoaFisica("Danilo", "Rua 1", "000.000.000-00");
  print(pessoaFisica1);

  var pessoaJuridica1 =
      PessoaJuridica("Empresa 1", "Rua 2", "000.0000.0001/00");
  print(pessoaJuridica1);
}
