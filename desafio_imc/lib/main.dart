import 'package:desafio_imc/shared/app_colors.dart';
import 'package:desafio_imc/shared/constants.dart';
import 'package:desafio_imc/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'header_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                    String peso = pesoController.text;
                    String altura = alturaController.text;

                    print("$nome, $peso, $altura");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
