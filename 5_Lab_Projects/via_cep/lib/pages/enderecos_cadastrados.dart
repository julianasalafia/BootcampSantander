import 'package:flutter/material.dart';
import 'package:via_cep/pages/main_page.dart';

class EnderecosCadastradosPage extends StatefulWidget {
  const EnderecosCadastradosPage({super.key});

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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainPage()));
              },
              child: const Text('voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
