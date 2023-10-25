import 'package:flutter/material.dart';
import 'package:via_cep/repository/cep_repository.dart';
import 'package:via_cep/shared/text_shared_widget.dart';

import '../Model/cep_model.dart';
import '../shared/app_colors.dart';
import '../utils/constants.dart';

class CepInfoPage extends StatelessWidget {
  final cepRepository = CEPRepository();
  final Cep cep;

  CepInfoPage({super.key, required this.cep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(infoCepTitle),
        backgroundColor: AppColors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              searchImage,
              height: 100,
            ),
            const SizedBox(height: 25),
            TextSharedWidget(
              title: '${cep.cep}',
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: AppColors.blue,
            ),
            TextSharedWidget(
              title: '${cep.logradouro}',
              fontSize: 18,
            ),
            TextSharedWidget(
              title: '${cep.bairro}',
              fontSize: 18,
            ),
            TextSharedWidget(
              title: '${cep.cidade}',
              fontSize: 18,
            ),
            TextSharedWidget(
              title: '${cep.estado}',
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
