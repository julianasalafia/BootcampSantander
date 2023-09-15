import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/via_cep_model.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: '');
  String endereco = '';
  String cidade = '';
  String estado = '';
  bool loading = false;

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
                  print(cep);
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    var response = await http
                        .get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
                    print(response.statusCode);
                    print(response.body);
                    var json = jsonDecode(response.body);
                    var viaCepModel = ViaCEPModel.fromJson(json);
                    print(viaCepModel);
                    cidade = viaCepModel.localidade ?? '';
                    estado = viaCepModel.uf ?? '';
                    endereco = viaCepModel.logradouro ?? '';
                  } else {
                    cidade = '';
                    estado = '';
                    endereco = '';
                  }
                  setState(() {
                    loading = false;
                  });
                }
              },
            ),
            SizedBox(height: 50),
            Text(
              endereco,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '$cidade - $estado',
              style: TextStyle(fontSize: 22),
            ),
            if (loading) CircularProgressIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response =
              await http.get(Uri.parse('https://www.google.com/juliana'));
          print(response.statusCode);
          print(response.body);
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
