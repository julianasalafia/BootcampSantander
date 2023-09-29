import 'package:flutter/material.dart';

import '../Model/cep_model.dart';
import '../repository/cep_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CEPRepository cepRepository = CEPRepository();
  TextEditingController cepController = TextEditingController();
  String endereco = '-';
  CepModel _ceps = CepModel([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCeps();
  }

  Future<CepModel> getCeps() async {
    return _ceps = await cepRepository.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CEP')),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Consultar CEP:'),
                TextField(controller: cepController),
                const SizedBox(height: 10),
                Text(endereco),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.blue,
                  child: TextButton(
                      onPressed: () async {
                        _ceps = await getCeps();

                        List<Cep> busca = _ceps.ceps
                            .where(
                                (element) => element.cep == cepController.text)
                            .toList();

                        if (busca.isNotEmpty) {
                          setState(() {
                            endereco = 'CEP consta na lista.';
                          });
                        } else {
                          setState(() {
                            endereco = 'CEP não consta.';
                          });
                        }
                      },
                      child: const Text(
                        'Conferir!',
                        style: TextStyle(color: Colors.white),
                      )),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
