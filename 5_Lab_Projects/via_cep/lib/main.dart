import 'package:flutter/material.dart';
import 'package:via_cep/Model/cep_model.dart';
import 'package:via_cep/repository/cep_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CEPRepository cepRepository = CEPRepository();
  var _ceps = CepModel([]);

  void getCeps() async {
    _ceps = await cepRepository.get();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CEP')),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Text('Consultar CEP:'),
                  TextField(),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {},
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
      ),
    );
  }
}
