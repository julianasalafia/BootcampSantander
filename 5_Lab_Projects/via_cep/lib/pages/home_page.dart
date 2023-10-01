import 'package:flutter/material.dart';

import '../Model/cep_model.dart';
import '../repository/cep_repository.dart';
import '../shared/app_colors.dart';
import '../shared/custom_drawer.dart';
import 'cadastro_cep_page.dart';

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
      appBar: AppBar(backgroundColor: AppColors.blue),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 50.0, left: 50.0, top: 80.0),
              child: Image.asset(
                'assets/correios-logo.png',
              ),
            ),
            TextField(
              controller: cepController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '00000-000',
                suffixIcon: GestureDetector(
                  onTap: () async {
                    _ceps = await getCeps();

                    List<Cep> busca = _ceps.ceps
                        .where((element) => element.cep == cepController.text)
                        .toList();

                    if (busca.isNotEmpty) {
                      setState(() {
                        endereco = 'CEP encontrado.';
                      });
                    } else {
                      setState(() {
                        endereco = 'CEP não encontrado.';
                      });
                    }
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(
                  endereco,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CadastroCepPage()));
                    },
                    child: const Text(
                      'Cadastrar CEP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
