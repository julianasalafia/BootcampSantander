import 'package:desafio_imc/pages/page_results.dart';
import 'package:desafio_imc/pessoa.dart';
import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:desafio_imc/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_widget.dart';
import 'imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String imcText = '';
  String result = '';
  late String nome;
  double? peso;
  double? altura;
  late CategoriaIMC categoria;
  late TextEditingController nomeController;
  late TextEditingController pesoController;
  late TextEditingController alturaController;
  Pessoa pessoa = Pessoa('', 0.0, 0.0);
  late IMC resultadoIMC;
  List<Pessoa> pessoas = [];
  Map<Pessoa, IMC> setPessoasIMC = {};

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    pesoController = TextEditingController();
    alturaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.rosa,
          appBar: AppBar(
            backgroundColor: AppColors.rosaDuo,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeaderWidget(),
                  const SizedBox(height: height),
                  buildTextField(hintText: 'nome', controller: nomeController),
                  const SizedBox(height: height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            buildTextField(
                                hintText: 'peso', controller: pesoController),
                          ],
                        ),
                      ),
                      const SizedBox(width: width),
                      Expanded(
                        child: Column(
                          children: [
                            buildTextField(
                                hintText: 'altura',
                                controller: alturaController),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: height),
                  TextButtonWidget(
                    onPressed: () {
                      nome = nomeController.text;
                      peso = double.tryParse(pesoController.text);
                      altura = double.tryParse(alturaController.text);

                      if (nome == '' ||
                          !nome.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
                        scaffoldMessengerKey.currentState!
                            .showSnackBar(const SnackBar(
                          content: Text('Preencha um nome válido.'),
                        ));
                        return;
                      }

                      if (peso == null) {
                        scaffoldMessengerKey.currentState!
                            .showSnackBar(const SnackBar(
                          content: Text('Preencha o campo peso adequadamente.'),
                        ));
                        return;
                      }

                      if (altura == null) {
                        scaffoldMessengerKey.currentState!
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Preencha o campo altura adequadamente.'),
                        ));
                        return;
                      }
                      pessoa = Pessoa(nome, peso, altura);
                      resultadoIMC = IMC(pessoa);
                      pessoas.add(pessoa);
                      setPessoasIMC[pessoa] = resultadoIMC;

                      print(setPessoasIMC);

                      setState(() {
                        imcText =
                            'IMC: ${resultadoIMC.imc?.toStringAsFixed(1)}';
                        categoria = resultadoIMC.getCategoriaIMC(resultadoIMC);
                        result =
                            resultadoIMC.getDescricaoCategoriaIMC(categoria);
                      });
                    },
                  ),
                  const SizedBox(height: height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Text(
                            imcText,
                            style: kTextTitleResultBorderStyle,
                          ),
                          Text(
                            imcText,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Modak',
                                fontSize: 50.0),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      setPessoasIMC.isEmpty
                          ? Container()
                          : FloatingActionButton(
                              mini: true,
                              backgroundColor: AppColors.rosaTrio,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: AppColors.vinho),
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Icon(Icons.open_in_full),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PageResults()),
                                );
                              }),
                    ],
                  ),
                  Stack(
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        result.toUpperCase(),
                        style: kResultTextStyleBorderStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      setPessoasIMC.isEmpty
                          ? Container()
                          : Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      Text(
                                        'nome',
                                        style: kResultTextStyle,
                                      ),
                                      Text(
                                        'nome',
                                        style: kResultTextStyleBorderStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Text(
                                        'kg',
                                        style: kResultTextStyle,
                                      ),
                                      Text(
                                        'kg',
                                        style: kResultTextStyleBorderStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Text(
                                        'cm',
                                        style: kResultTextStyle,
                                      ),
                                      Text(
                                        'cm',
                                        style: kResultTextStyleBorderStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Text(
                                        'IMC',
                                        style: kResultTextStyle,
                                      ),
                                      Text(
                                        'IMC',
                                        style: kResultTextStyleBorderStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      ...setPessoasIMC.entries.map((entry) {
                        Pessoa pessoa = entry.key;
                        IMC imc = entry.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                pessoa.nome.toString(),
                                style: kListTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                pessoa.peso.toString(),
                                style: kListTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                pessoa.altura!.toStringAsFixed(0),
                                style: kListTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                imc.imc!.toStringAsFixed(1),
                                style: kListTextStyle,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
