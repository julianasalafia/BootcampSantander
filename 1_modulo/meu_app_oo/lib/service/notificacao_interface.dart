import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/service/enviar_notificacao.dart';

abstract class NotificacaoInterface {
  void enviarNotificacao(Pessoa pessoa);
}
