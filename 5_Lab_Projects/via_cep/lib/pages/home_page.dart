import 'package:flutter/material.dart';
import '../Model/cep_model.dart';
import '../core/formatter/cep_input_formatter.dart';
import '../repository/cep_repository.dart';
import '../shared/app_colors.dart';

class HomePage extends StatefulWidget {
  final CEPRepository cepRepository;
  final VoidCallback onPageChanged;
  const HomePage(
      {super.key, required this.cepRepository, required this.onPageChanged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();
  var endereco = '';
  CepModel _ceps = CepModel([]);

  @override
  void initState() {
    super.initState();
    getCeps();
  }

  Future<CepModel> getCeps() async {
    return _ceps = await widget.cepRepository.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              inputFormatters: [
                CepInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              controller: cepController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '00000-000',
                suffixIcon: GestureDetector(
                  onTap: () async {
                    Iterable<Cep> listaCEPS = _ceps.ceps
                        .where((element) => element.cep == cepController.text)
                        .toList();

                    var infoCEP = listaCEPS
                        .map((e) =>
                            '${e.cep} \n${e.bairro} \n${e.logradouro} \n${e.cidade} - ${e.estado}')
                        .join();

                    setState(() {
                      endereco = infoCEP;
                    });

                    if (endereco == '') {
                      endereco = 'CEP não cadastrado';
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
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: widget.onPageChanged,
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
