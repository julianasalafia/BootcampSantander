import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
              onChanged: (String value) {
                if (value != null && value.trim().length == 8) {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  print(cep);
                  if (cep.length == 8) {
                    cidade = "Cidade";
                    estado = "Estado";
                    endereco = "Endereco";
                  } else {
                    cidade = '';
                    estado = '';
                    endereco = '';
                  }
                  setState(() {});
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
