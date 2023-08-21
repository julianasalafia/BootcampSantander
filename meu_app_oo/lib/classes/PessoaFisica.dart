import 'package:meu_app_oo/classes/Pessoa.dart';

class PessoaFisica extends Pessoa {
  String? _cpf;

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String? getCpf() {
    return _cpf;
  }

  PessoaFisica(String nome, String endereco, String cpf)
      : super(nome, endereco) {
    _cpf = cpf;
  }

  @override
  String toString() {
    return {
      "tipo": "PF",
      "Nome": super.getNome(),
      "Endereco": super.getEndereco(),
      "CPF": _cpf,
    }.toString();
  }
}
