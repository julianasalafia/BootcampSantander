import 'package:flutter/material.dart';
import 'package:via_cep/pages/main_page.dart';

import '../shared/app_colors.dart';

class CadastroCepPage extends StatefulWidget {
  const CadastroCepPage({super.key});

  @override
  State<CadastroCepPage> createState() => _CadastroCepPageState();
}

class _CadastroCepPageState extends State<CadastroCepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de endereço'),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 50.0, left: 50.0, top: 50.0, bottom: 80.0),
                child: Image.asset('assets/correios-logo.png'),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Logradouro'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Complemento',
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bairro',
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cidade',
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UF',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MainPage()));
                        },
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
