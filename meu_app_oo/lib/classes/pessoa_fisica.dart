import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {
  String? _cpf;

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String? getCpf() {
    return _cpf;
  }

  PessoaFisica(String nome, String endereco, String cpf,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
    _cpf = cpf;
  }

  @override
  String toString() {
    return {
      "tipo": "PF",
      "Nome": super.getNome(),
      "Endereco": super.getEndereco(),
      "CPF": _cpf,
      "TipoNotificacao": super.getTipoNotificacao()
    }.toString();
  }
}
