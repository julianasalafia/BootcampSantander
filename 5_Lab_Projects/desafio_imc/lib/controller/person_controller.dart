import 'package:desafio_imc/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../imc.dart';

class PersonController {
  Future<PersonModel> create({
    required TextEditingController nameController,
    required TextEditingController weightController,
    required TextEditingController heightController,
  }) async {
    final imc = IMC.calculateIMC(
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
    );

    final categoryIMC = IMC.getCategoriaIMC(imc);

    final imcDescription = IMC.getDescricaoCategoriaIMC(categoryIMC);

    final person = PersonModel.create(
      name: nameController.text,
      height: heightController.text,
      weight: weightController.text,
      imc: imc,
      status: imcDescription,
    );

    final box = Hive.box('result');
    await box.put(person.id, person.toJson());
    return person;
  }

  List<PersonModel> load() {
    final box = Hive.box('result');

    final result = box.values.map((e) => PersonModel.fromJson(e));
    return result.toList();
  }
}
