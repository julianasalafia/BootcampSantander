import 'package:desafio_imc/model/person_model.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class SinglePersonResultPage extends StatelessWidget {
  final PersonModel person;

  const SinglePersonResultPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.rosaDuo,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/hello-kitty.png',
              scale: 1.5,
            ),
            Text('Nome: ${person.name}'),
            Text('Peso: ${person.weight}'),
            Text('Altura: ${person.height}'),
            Text('IMC: ${person.imc}'),
          ],
        ),
      ),
    );
  }
}
