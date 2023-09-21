import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_model.dart';

import '../../repositories/back4app/tarefas_back4app_repository.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({super.key});

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4App = await tarefaRepository.obterTarefas(apenasNaoConcluidos);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tarefas HTTP'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            descricaoController.text = '';
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: Text('Adicionar tarefa'),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          // await tarefaRepository.salvar(TarefaSQLiteModel(
                          //     0, descricaoController.text, false));
                          Navigator.pop(context);
                          obterTarefas();
                          setState(() {});
                        },
                        child: Text('Salvar'),
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apenas não concluído',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: apenasNaoConcluidos,
                        onChanged: (bool value) {
                          apenasNaoConcluidos = value;
                          obterTarefas();
                        }),
                  ],
                ),
              ),
              carregando
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _tarefasBack4App.tarefas.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = _tarefasBack4App.tarefas[index];
                            return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                // tarefaRepository.remover(tarefa.id);
                                obterTarefas();
                              },
                              key: Key(tarefa.descricao),
                              child: ListTile(
                                title: Text(tarefa.descricao),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    tarefa.concluido = value;
                                    // tarefaRepository.atualizar(tarefa);
                                    obterTarefas();
                                  },
                                  value: tarefa.concluido,
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
  }
}
