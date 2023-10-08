import 'package:flutter/material.dart';
import 'package:via_cep/store/enderecos_cadastrados_store.dart';
import '../shared/app_colors.dart';

class EnderecosCadastradosPage extends StatefulWidget {
  final EnderecosCadastradosStore enderecosCadastradosStore;
  const EnderecosCadastradosPage(
      {super.key, required this.enderecosCadastradosStore});

  @override
  State<EnderecosCadastradosPage> createState() =>
      _EnderecosCadastradosPageState();
}

class _EnderecosCadastradosPageState extends State<EnderecosCadastradosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços cadastrados'),
        backgroundColor: AppColors.blue,
      ),
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
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                            )),
                                        IconButton(
                                            onPressed: () {},
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
