import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

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
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text = await configuracoesModel.nomeUsuario;
    alturaController.text = await configuracoesModel.altura.toString();
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
                value: configuracoesModel.receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: Text('Tema escuro'),
                value: configuracoesModel.temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configuracoesModel.altura =
                        double.parse(alturaController.text);
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
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                  configuracoesRepository.salvar(configuracoesModel);

                  Navigator.pop(context);
                },
                child: Text('Salvar')),
          ],
        ),
      ),
    ));
  }
}
