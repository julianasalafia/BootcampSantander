import 'package:flutter/material.dart';
import 'package:via_cep/Model/cep_model.dart';
import 'package:via_cep/store/enderecos_cadastrados_store.dart';
import '../repository/cep_repository.dart';

class EnderecosCadastradosPage extends StatefulWidget {
  final Function(Cep) onCepEdit;
  final CEPRepository cepRepository;
  final EnderecosCadastradosStore enderecosCadastradosStore;
  const EnderecosCadastradosPage({
    super.key,
    required this.enderecosCadastradosStore,
    required this.cepRepository,
    required this.onCepEdit,
  });

  @override
  State<EnderecosCadastradosPage> createState() =>
      _EnderecosCadastradosPageState();
}

class _EnderecosCadastradosPageState extends State<EnderecosCadastradosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: widget.enderecosCadastradosStore,
                builder: (context, value, child) {
                  return value.isLoading
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: ListView.builder(
                          itemCount: value.ceps.length,
                          itemBuilder: (context, index) {
                            final cep = value.ceps[index];
                            return Card(
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/correios-busca.png',
                                      height: 60,
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${cep.cep}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          Text('${cep.cidade}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                widget.onCepEdit(cep),
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              await widget.cepRepository
                                                  .delete(cep.objectId);

                                              setState(() {
                                                widget.enderecosCadastradosStore
                                                    .getCeps();
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ));
                }),
          ],
        ),
      ),
    );
  }
}
