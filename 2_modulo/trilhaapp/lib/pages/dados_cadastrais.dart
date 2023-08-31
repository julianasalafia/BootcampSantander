import 'package:flutter/material.dart';

import '../shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: '');
  var dataNascimentoController = TextEditingController(text: '');
  DateTime? dataNascimento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus dados'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(texto: 'Nome'),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(height: 10),
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
                  dataNascimento = data;
                }
              },
            ),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNascimento);
                },
                child: Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
