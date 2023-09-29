import 'package:desafio_imc/pages/page_results.dart';
import 'package:desafio_imc/pessoa.dart';
import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:desafio_imc/text_button_widget.dart';
import 'package:desafio_imc/widgets/floating_action_button_widget.dart';
import 'package:desafio_imc/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/header_widget.dart';
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
  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  final CHAVE_ALTURA_USUARIO = 'CHAVE_ALTURA_USUARIO';
  String imcText = '';
  String result = '';
  String? nome;
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
  ShowSnackBarWidget showSnackBarWidget = ShowSnackBarWidget();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    pesoController = TextEditingController();
    alturaController = TextEditingController();

    loadData();
  }

  void loadData() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      nome = storage.getString(CHAVE_NOME_USUARIO)!;
      altura = storage.getDouble(CHAVE_ALTURA_USUARIO)!;
    });
    nomeController.text = nome!;
    alturaController.text = altura!.toString();
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, bottom: 15.0, right: 25.0, left: 25.0),
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
                        child: buildTextField(
                            controller: pesoController, hintText: 'peso'),
                      ),
                      const SizedBox(width: width),
                      Expanded(
                        child: buildTextField(
                            controller: alturaController, hintText: 'altura'),
                      ),
                    ],
                  ),
                  const SizedBox(height: height),
                  TextButtonWidget(
                    onPressed: () async {
                      final storage = await SharedPreferences.getInstance();
                      convertType();

                      showSnackBarWidget.validateString(
                          scaffoldMessengerKey, nome!, 'nome');

                      if (nome!.isNotEmpty) {
                        showSnackBarWidget.validateDouble(
                            scaffoldMessengerKey, peso, 'peso');
                      }

                      if (!peso!.isNaN) {
                        showSnackBarWidget.validateDouble(
                            scaffoldMessengerKey, altura, 'altura');
                      }

                      pessoa = Pessoa(nome, peso, altura);
                      resultadoIMC = IMC(pessoa);
                      pessoas.add(pessoa);

                      setPessoasIMC[pessoa] = resultadoIMC;

                      setState(() {
                        printIMCResult();
                        pesoController.clear();
                      });
                      storage.setString(CHAVE_NOME_USUARIO, nome!);
                      storage.setDouble(CHAVE_ALTURA_USUARIO, altura!);
                    },
                  ),
                  const SizedBox(height: height),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Stack(
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: FloatingActionButtonWidget(
                          page: PageResults(
                            pessoasIMC: setPessoasIMC,
                          ),
                        ),
                      ),
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
                      const SizedBox(height: 10),
                      setPessoasIMC.isEmpty
                          ? Container()
                          : Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      const Text(
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
                                      const Text(
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
                                      const Text(
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

  void printIMCResult() {
    imcText = 'IMC: ${resultadoIMC.imc?.toStringAsFixed(1)}';
    categoria = resultadoIMC.getCategoriaIMC(resultadoIMC);
    result = resultadoIMC.getDescricaoCategoriaIMC(categoria);
  }

  void convertType() {
    nome = nomeController.text;
    peso = double.tryParse(pesoController.text);
    altura = double.tryParse(alturaController.text);
  }
}
