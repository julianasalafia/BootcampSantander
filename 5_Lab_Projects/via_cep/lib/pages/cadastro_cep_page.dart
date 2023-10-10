import 'package:flutter/material.dart';
import 'package:via_cep/Model/cep_model.dart';
import 'package:via_cep/core/formatter/cep_input_formatter.dart';
import '../repository/cep_repository.dart';
import '../shared/app_colors.dart';

class CadastroCepPage extends StatefulWidget {
  final CEPRepository cepRepository;
  final Cep? cep;
  const CadastroCepPage({super.key, required this.cepRepository, this.cep});

  @override
  State<CadastroCepPage> createState() => _CadastroCepPageState();
}

class _CadastroCepPageState extends State<CadastroCepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  List<Cep> cepList = [];

  void getListaCeps() async {
    List<Cep> lista = await widget.cepRepository.getLista();
    setState(() {
      cepList.addAll(lista);
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.cep != null) {
      final cepUser = widget.cep;
      cepController.text = cepUser?.cep ?? '';
      logradouroController.text = cepUser?.logradouro ?? '';
      bairroController.text = cepUser?.bairro ?? '';
      cidadeController.text = cepUser?.cidade ?? '';
      ufController.text = cepUser?.estado ?? '';
    }
    getListaCeps();
  }

  void getDialogResponse({
    required String titulo,
    required String descricao,
    bool isEdit = false,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(descricao),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tentar novamente')),
              TextButton(
                  onPressed: () {
                    if (isEdit) Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.cep != null
          ? AppBar(
              title: const Text('Atualizar cadastro'),
              backgroundColor: AppColors.blue,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 50.0, left: 50.0, top: 50.0, bottom: 80.0),
                child: Image.asset('assets/correios-logo.png'),
              ),
              TextField(
                inputFormatters: [
                  CepInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                controller: cepController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: logradouroController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Logradouro'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: bairroController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bairro',
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cidadeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cidade',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: TextField(
                      controller: ufController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UF',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final cep = cepList
                              .where((element) =>
                                  element.cep == cepController.text)
                              .toList();

                          if (cep.isNotEmpty && widget.cep == null) {
                            getDialogResponse(
                              titulo: 'Falha no cadastro',
                              descricao:
                                  'O CEP digitado já está cadastrado na base de dados. Por favor, insira um novo CEP ou verifique os dados.',
                            );
                            return;
                          }

                          if (cepController.text.isEmpty ||
                              logradouroController.text.isEmpty ||
                              bairroController.text.isEmpty ||
                              cidadeController.text.isEmpty ||
                              ufController.text.isEmpty) {
                            getDialogResponse(
                              titulo: 'Aviso!',
                              descricao:
                                  'Preencha todos os campos para efetuar o cadastro.',
                            );
                            return;
                          }

                          if (widget.cep == null) {
                            await widget.cepRepository.create(
                              cepController.text,
                              logradouroController.text,
                              bairroController.text,
                              cidadeController.text,
                              ufController.text,
                            );

                            getDialogResponse(
                              titulo: 'Sucesso',
                              descricao:
                                  'O CEP foi cadastrado com sucesso! Você pode agora prosseguir com as próximas etapas.',
                            );
                          } else {
                            await widget.cepRepository.update(
                              cep: cepController.text,
                              logradouro: logradouroController.text,
                              bairro: bairroController.text,
                              cidade: cidadeController.text,
                              estado: ufController.text,
                              objectId: widget.cep!.objectId,
                            );

                            getDialogResponse(
                              titulo: 'Sucesso',
                              descricao:
                                  'O CEP foi atualizado com sucesso! Você pode agora prosseguir com as próximas etapas.',
                              isEdit: true,
                            );
                          }
                          setState(() {
                            getListaCeps();
                          });
                        },
                        child: Text(
                          widget.cep == null
                              ? 'Cadastrar'
                              : 'Atualizar Cadastro',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
