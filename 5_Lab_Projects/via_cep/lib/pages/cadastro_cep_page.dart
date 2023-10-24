import 'package:flutter/material.dart';
import 'package:via_cep/Model/cep_model.dart';
import 'package:via_cep/core/formatter/cep_input_formatter.dart';
import '../repository/cep_repository.dart';
import '../shared/app_colors.dart';
import '../utils/constants.dart';
import '../widgets/image_logo_widget.dart';
import '../widgets/text_field_widget.dart';

class CadastroCepPage extends StatefulWidget {
  final CEPRepository cepRepository;
  final Cep? cep;
  const CadastroCepPage({super.key, required this.cepRepository, this.cep});

  @override
  State<CadastroCepPage> createState() => _CadastroCepPageState();
}

class _CadastroCepPageState extends State<CadastroCepPage> {
  final cepController = TextEditingController();
  final streetController = TextEditingController();
  final neighbourhoodController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final cepInputFormatter = CepInputFormatter();
  List<Cep> cepList = [];

  void getCepList() async {
    List<Cep> list = await widget.cepRepository.getList();
    setState(() {
      cepList.addAll(list);
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.cep != null) {
      final cepUser = widget.cep;
      cepController.text = cepUser?.cep ?? '';
      streetController.text = cepUser?.logradouro ?? '';
      neighbourhoodController.text = cepUser?.bairro ?? '';
      cityController.text = cepUser?.cidade ?? '';
      stateController.text = cepUser?.estado ?? '';
    }
    getCepList();
  }

  void getDialogResponse({
    required String title,
    required String description,
    bool isEdit = false,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(tryAgainMessage)),
              TextButton(
                  onPressed: () {
                    if (isEdit) Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(confirmMessage)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.cep != null
          ? AppBar(
              title: const Text(updateCepTitle),
              backgroundColor: AppColors.blue,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ImageLogoWidget(),
              TextFieldWidget(
                controller: cepController,
                label: labelCep,
                cepInputFormatter: cepInputFormatter,
              ),
              const SizedBox(height: 15),
              TextFieldWidget(controller: streetController, label: labelStreet),
              const SizedBox(height: 15),
              TextFieldWidget(
                  controller: neighbourhoodController,
                  label: labelNeighbourhood),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                        controller: cityController, label: labelCity),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: TextFieldWidget(
                        controller: stateController, label: labelState),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final cep = cepList
                              .where((element) =>
                                  element.cep == cepController.text)
                              .toList();

                          if (cep.isNotEmpty && widget.cep == null) {
                            getDialogResponse(
                              title: dialogTitleFailed,
                              description: dialogDescriptionFailed,
                            );
                            return;
                          }

                          if (cepController.text.isEmpty ||
                              streetController.text.isEmpty ||
                              neighbourhoodController.text.isEmpty ||
                              cityController.text.isEmpty ||
                              stateController.text.isEmpty) {
                            getDialogResponse(
                              title: dialogTitleWarning,
                              description: dialogDescriptionWarning,
                            );
                            return;
                          }

                          if (widget.cep == null) {
                            await createCep();

                            getDialogResponse(
                              title: dialogTitleSuccess,
                              description: dialogDescriptionSuccess,
                            );
                          } else {
                            await updateCep();

                            getDialogResponse(
                              title: dialogTitleSuccess,
                              description: dialogDescriptionUpdatedSuccess,
                              isEdit: true,
                            );
                          }
                          setState(() {
                            getCepList();
                          });
                        },
                        child: Text(
                          widget.cep == null
                              ? registerTitle
                              : updateRegisterTitle,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createCep() async {
    await widget.cepRepository.create(
      cepController.text,
      streetController.text,
      neighbourhoodController.text,
      cityController.text,
      stateController.text,
    );
  }

  Future<void> updateCep() async {
    await widget.cepRepository.update(
      cep: cepController.text,
      logradouro: streetController.text,
      bairro: neighbourhoodController.text,
      cidade: cityController.text,
      estado: stateController.text,
      objectId: widget.cep!.objectId,
    );
  }
}
