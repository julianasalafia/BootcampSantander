import 'package:flutter/material.dart';
import 'package:via_cep/core/formatter/cep_input_formatter.dart';
import '../Model/cep_model.dart';
import '../repository/cep_repository.dart';
import '../shared/app_colors.dart';

class CadastroCepPage extends StatefulWidget {
  const CadastroCepPage({super.key});

  @override
  State<CadastroCepPage> createState() => _CadastroCepPageState();
}

class _CadastroCepPageState extends State<CadastroCepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  CEPRepository cepRepository = CEPRepository();
  List<String> cepInfo = [];
  late bool isRegistered;

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
              TextField(
                inputFormatters: [
                  CepInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                controller: cepController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: logradouroController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Logradouro'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: bairroController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bairro',
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cidadeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cidade',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: TextField(
                      controller: ufController,
                      decoration: const InputDecoration(
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
                        onPressed: () async {
                          await cepRepository.create(
                            true,
                            cepController.text,
                            logradouroController.text,
                            bairroController.text,
                            cidadeController.text,
                            ufController.text,
                          );
                          // Navigator.pop(context);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const MainPage()));
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
