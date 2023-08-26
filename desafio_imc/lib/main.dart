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
  String imcText = '';
  String result = '';

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
                      result = returnIMCCategory(imc);
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

  String returnIMCCategory(double imc) {
    if (imc < 16) {
      return 'magreza grave';
    }

    if (imc >= 16 && imc < 17) {
      return 'magreza moderada';
    }

    if (imc >= 17 && imc < 18.5) {
      return 'magreza leve';
    }

    if (imc >= 18.5 && imc < 25) {
      return 'saudável';
    }

    if (imc >= 25 && imc < 30) {
      return 'sobrepeso';
    }

    if (imc >= 30 && imc < 35) {
      return 'obesidade grau I';
    }
    if (imc >= 35 && imc < 40) {
      return 'obesidade grau II';
    }

    if (imc >= 40) {
      return 'obesidade grau III';
    }
    return '';
  }
}
