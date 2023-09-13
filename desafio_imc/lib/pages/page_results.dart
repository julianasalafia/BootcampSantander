import 'package:flutter/material.dart';

import '../imc.dart';
import '../pessoa.dart';
import '../shared/app_colors.dart';

class PageResults extends StatelessWidget {
  final Map<Pessoa, IMC> pessoasIMC;
  const PageResults({super.key, required this.pessoasIMC});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.rosaDuo,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/hello-kitty.png',
              scale: 1.5,
            ),
          ),
          Expanded(
            child: ListView(
              children: pessoasIMC.entries.map((entry) {
                Pessoa pessoa = entry.key;
                IMC imc = entry.value;
                return ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    size: 50.0,
                  ),
                  iconColor: AppColors.rosaDuo,
                  title: Text(pessoa.nome.toString()),
                  subtitle: Text(
                      'Peso: ${pessoa.peso.toString()}, Altura: ${pessoa.altura!.toStringAsFixed(0)}, IMC: ${imc.imc!.toStringAsFixed(1)}'),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
