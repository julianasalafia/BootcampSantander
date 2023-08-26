import 'package:desafio_imc/pessoa.dart';
import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:desafio_imc/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'header_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String imcText = 'IMC: 0.0';

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final pesoController = TextEditingController();
    final alturaController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.rosa,
        appBar: AppBar(
          backgroundColor: AppColors.rosaDuo,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
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
                              hintText: 'altura', controller: alturaController),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: height),
                TextButtonWidget(
                  onPressed: () {
                    String nome = nomeController.text;
                    double? peso = double.parse(pesoController.text);
                    double? altura = double.parse(alturaController.text);

                    Pessoa pessoa = Pessoa(nome, peso, altura);
                    double imc = calculateIMC(pessoa.peso, pessoa.altura);
                    setState(() {
                      imcText = 'IMC: ${imc.toStringAsFixed(1)}';
                    });
                  },
                ),
                const SizedBox(height: height),
                Stack(
                  children: [
                    Text(
                      imcText,
                      style: kTextTitleResultBorderStyle,
                    ),
                    Text(
                      imcText,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Modak',
                          fontSize: 50.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateIMC(double? peso, double? altura) {
    double alturaEmMetros = altura! / 100;
    return peso! / (alturaEmMetros! * alturaEmMetros);
  }
}
