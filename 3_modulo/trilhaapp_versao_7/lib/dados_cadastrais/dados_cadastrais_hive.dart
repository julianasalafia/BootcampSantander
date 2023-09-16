import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import '../repositories/linguagens_repository.dart';
import '../shared/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({super.key});

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();

  var nomeController = TextEditingController(text: '');
  var dataNascimentoController = TextEditingController(text: '');
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();

    nomeController.text = dadosCadastraisModel.nome ?? '';
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ''
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(
        DropdownMenuItem(
          child: Text(i.toString()),
          value: i,
        ),
      );
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus dados'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: salvando
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: 'Nome'),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: 'Data de nascimento'),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 5, 20),
                        lastDate: DateTime(2023, 10, 23),
                      );

                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dadosCadastraisModel.dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: 'Nível de experiência'),
                  Column(
                    children: niveis
                        .map(
                          (nivel) => RadioListTile(
                            title: Text(nivel.toString()),
                            selected:
                                dadosCadastraisModel.nivelExperiencia == nivel,
                            value: nivel,
                            groupValue: dadosCadastraisModel.nivelExperiencia,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                dadosCadastraisModel.nivelExperiencia =
                                    value.toString();
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  TextLabel(texto: 'Linguagens preferidas'),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            title: Text(linguagem),
                            value: dadosCadastraisModel.linguagens
                                .contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .add(linguagem);
                                });
                              } else {
                                setState(() {
                                  dadosCadastraisModel.linguagens
                                      .remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  TextLabel(texto: 'Tempo de experiência'),
                  DropdownButton(
                      value: dadosCadastraisModel.tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          'Pretensão salarial: R\$${dadosCadastraisModel.salario?.round().toString()}.'),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (double value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                      }),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('O nome deve ser preenchido.')),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Data de nascimento inválida.')),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.nivelExperiencia == null ||
                            dadosCadastraisModel.nivelExperiencia!.trim() ==
                                '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('O nível deve ser selecionado.')),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.linguagens.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Deve ser selecionada ao menos uma linguagem.')),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.tempoExperiencia == null ||
                            dadosCadastraisModel.tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Deve ter ao menos um ano de experiência em uma das linguagens.')),
                          );
                          return;
                        }

                        if (dadosCadastraisModel.salario == null ||
                            dadosCadastraisModel.salario == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'A pretensão salarial deve ser maior que zero.')),
                          );
                          return;
                        }
                        dadosCadastraisModel.nome = nomeController.text;
                        dadosCadastraisRepository.salvar(dadosCadastraisModel);

                        setState(() {
                          salvando = true;
                        });

                        print('Dados salvos com sucesso.');

                        Future.delayed(Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Dados salvos com sucesso.')));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: Text('Salvar')),
                ],
              ),
      ),
    );
  }
}
