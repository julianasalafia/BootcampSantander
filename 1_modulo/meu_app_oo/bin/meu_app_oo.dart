import 'package:meu_app_oo/classes/pessoa_fisica.dart';
import 'package:meu_app_oo/classes/pessoa_juridica.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';
import 'package:meu_app_oo/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  var pessoaFisica1 = PessoaFisica("Danilo", "Rua 1", "000.000.000-00",
      tipoNotificacao: TipoNotificacao.PUSH_NOTIFICATION);
  print(pessoaFisica1);

  var pessoaJuridica1 = PessoaJuridica("Empresa 1", "Rua 2", "000.0000.0001/00",
      tipoNotificacao: TipoNotificacao.EMAIL);
  print(pessoaJuridica1);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pessoaFisica1);
  enviarNotificacao.notificar(pessoaJuridica1);
}
