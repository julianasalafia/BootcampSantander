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
  late String nome;
  double? peso;
  double? altura;
  late CategoriaIMC categoria;
  late TextEditingController nomeController;
  late TextEditingController pesoController;
  late TextEditingController alturaController;

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
                    try {
                      nome = nomeController.text;
                      peso = double.parse(pesoController.text);
                      altura = double.parse(alturaController.text);

                      Pessoa pessoa = Pessoa(nome, peso, altura);

                      double imc = calculateIMC(pessoa.peso, pessoa.altura);
                      setState(() {
                        imcText = 'IMC: ${imc.toStringAsFixed(1)}';
                        categoria = getCategoriaIMC(imc);
                        result = getDescricaoCategoriaIMC(categoria);
                      });
                    } catch (exception) {
                      print('Por favor, digite valores válidos.');
                    }
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

  CategoriaIMC getCategoriaIMC(double imc) {
    if (imc < 16) {
      return CategoriaIMC.magrezaGrave;
    } else if (imc < 17) {
      return CategoriaIMC.magrezaModerada;
    } else if (imc < 18.5) {
      return CategoriaIMC.magrezaLeve;
    } else if (imc < 25) {
      return CategoriaIMC.saudavel;
    } else if (imc < 30) {
      return CategoriaIMC.sobrepeso;
    } else if (imc < 35) {
      return CategoriaIMC.obesidadeGrauI;
    } else if (imc < 40) {
      return CategoriaIMC.obesidadeGrauII;
    } else {
      return CategoriaIMC.obesidadeGrauIII;
    }
  }

  String getDescricaoCategoriaIMC(CategoriaIMC categoria) {
    switch (categoria) {
      case CategoriaIMC.magrezaGrave:
        return 'magreza grave';
      case CategoriaIMC.magrezaModerada:
        return 'magreza moderada';
      case CategoriaIMC.magrezaLeve:
        return 'magreza leve';
      case CategoriaIMC.saudavel:
        return 'saudável';
      case CategoriaIMC.sobrepeso:
        return 'sobrepeso';
      case CategoriaIMC.obesidadeGrauI:
        return 'obesidade grau I';
      case CategoriaIMC.obesidadeGrauII:
        return 'obesidade grau II';
      case CategoriaIMC.obesidadeGrauIII:
        return 'obesidade grau III';
      default:
        throw ArgumentError('Categoria inválida');
    }
  }
}
