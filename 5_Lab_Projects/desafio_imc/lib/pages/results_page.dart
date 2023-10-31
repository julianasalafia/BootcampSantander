import 'package:desafio_imc/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class ResultsPage extends StatelessWidget {
  List<PersonModel> persons = [];
  ResultsPage({
    super.key,
    required this.persons,
  });

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
              children: persons.map((person) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.rosa,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onPressed: () {
                      Modular.to.pushNamed(singlePersonResultPage);
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.person_rounded,
                        size: 50.0,
                      ),
                      iconColor: AppColors.rosaTrio,
                      title: Text(
                        person.name.toString(),
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Peso: ${person.weight.toString()}, Altura: ${person.height!}, IMC: ${person.imc!.toStringAsFixed(1)}'),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
