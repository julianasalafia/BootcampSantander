import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  AppStorageService storage = AppStorageService();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  final CHAVE_ALTURA = 'CHAVE_ALTURA';
  final CHAVE_RECEBER_NOTIFICACOES = 'CHAVE_RECEBER_NOTIFICACOES';
  final CHAVE_TEMA_ESCURO = 'CHAVE_MODO_ESCURO';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nome usuário',
                ),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Altura',
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: Text('Receber notificações'),
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: Text('Tema escuro'),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setConfiguracoesAltura(
                        double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('Meu app'),
                            content: Text('Favor informar uma altura válida.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                        });
                    return;
                  }
                  await storage
                      .setConfiguracoesNomeUsuario(nomeUsuarioController.text);

                  await storage
                      .setConfiguracoesReceberNotificacao(receberNotificacoes);

                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
                  Navigator.pop(context);
                },
                child: Text('Salvar')),
          ],
        ),
      ),
    ));
  }
}
