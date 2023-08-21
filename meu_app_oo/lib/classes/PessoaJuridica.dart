import 'package:meu_app_oo/classes/Pessoa.dart';

class PessoaJuridica extends Pessoa {
  String? _cnpj;

  void setCpf(String cnpj) {
    _cnpj = cnpj;
  }

  String? getCnpj() {
    return _cnpj;
  }

  PessoaJuridica(String nome, String endereco, String cnpj)
      : super(nome, endereco) {
    _cnpj = cnpj;
  }

  @override
  String toString() {
    return {
      "tipo": "PJ",
      "nome": super.getNome(),
      "endereco": super.getEndereco(),
      "CNPJ": _cnpj
    }.toString();
  }
}
