import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/via_cep_model.dart';

import '../repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: '');
  bool loading = false;
  var viaCepModel = ViaCEPModel();
  var viaCepRepository = ViaCEPRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              'Consulta de CEP',
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                if (value != null && value.trim().length == 8) {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    viaCepModel = await viaCepRepository.consultarCEP(cep);
                  } else {}
                  setState(() {
                    loading = false;
                  });
                }
              },
            ),
            SizedBox(height: 50),
            Text(
              viaCepModel.logradouro ?? '',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '${viaCepModel.localidade ?? ''} - ${viaCepModel.uf ?? ''}',
              style: TextStyle(fontSize: 22),
            ),
            if (loading) CircularProgressIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    ));
  }
}
