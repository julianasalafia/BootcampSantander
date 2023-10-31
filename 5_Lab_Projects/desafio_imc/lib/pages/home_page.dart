import 'package:desafio_imc/controller/person_controller.dart';
import 'package:desafio_imc/model/person_model.dart';
import 'package:desafio_imc/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';
import '../text_button_widget.dart';
import '../widgets/floating_action_button_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/show_snack_bar.dart';
import '../widgets/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final personController = PersonController();

  String imcText = '';
  String result = 'resultado';
  String imcDescription = '';

  String? nameUser;
  double? weightUser;
  double? heightUser;

  List<PersonModel> persons = [];

  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  final CHAVE_ALTURA_USUARIO = 'CHAVE_ALTURA_USUARIO';
  final CHAVE_PESO_USUARIO = 'CHAVE_PESO_USUARIO';

  ShowSnackBarWidget showSnackBarWidget = ShowSnackBarWidget();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    loadData();
    persons = personController.load();
  }

  void loadData() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      nameUser = storage.getString(CHAVE_NOME_USUARIO)!;
      heightUser = storage.getDouble(CHAVE_ALTURA_USUARIO)!;
    });
    nameController.text = nameUser!;
    heightController.text = heightUser.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.rosa,
          appBar: AppBar(
            backgroundColor: AppColors.rosaDuo,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeaderWidget(),
                  const SizedBox(height: height),
                  TextFieldWidget(controller: nameController, hintText: 'nome'),
                  const SizedBox(height: height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: weightController,
                          hintText: 'peso',
                        ),
                      ),
                      const SizedBox(width: width),
                      Expanded(
                        child: TextFieldWidget(
                          controller: heightController,
                          hintText: 'altura',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: height),
                  TextButtonWidget(
                    onPressed: () async {
                      final storage = await SharedPreferences.getInstance();

                      showSnackBarWidget.validateString(
                        scaffoldMessengerKey,
                        nameUser!,
                        'nome',
                      );

                      if (nameController.text.isNotEmpty) {
                        showSnackBarWidget.validateDouble(
                          scaffoldMessengerKey,
                          weightController.text,
                          'peso',
                        );
                      }

                      if (weightController.text.isNotEmpty) {
                        showSnackBarWidget.validateDouble(
                          scaffoldMessengerKey,
                          heightUser.toString(),
                          'altura',
                        );
                      }

                      final person = await personController.create(
                        nameController: nameController,
                        weightController: weightController,
                        heightController: heightController,
                      );

                      personController.load();

                      setState(() {
                        imcText = 'IMC: ${person.imc.toStringAsFixed(1)}';
                        imcDescription = person.status;
                      });

                      weightController.clear();
                      storage.setString(
                          CHAVE_NOME_USUARIO, nameController.text);
                      storage.setDouble(CHAVE_ALTURA_USUARIO,
                          double.parse(heightController.text));
                    },
                  ),
                  const SizedBox(height: height),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Stack(
                          children: [
                            Text(
                              imcText,
                              style: kTextTitleResultBorderStyle,
                            ),
                            Text(
                              imcText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Modak',
                                  fontSize: 50.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: FloatingActionButtonWidget(
                          page: ResultsPage(persons: persons),
                        ),
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
                  const Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'NOME',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'PESO',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'IMC',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'STATUS',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: persons.length,
                      itemBuilder: (context, index) {
                        final person = persons[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 3, child: Text(person.name)),
                                Expanded(flex: 2, child: Text(person.weight!)),
                                Expanded(
                                    flex: 2,
                                    child: Text(person.imc.toStringAsFixed(1))),
                                Expanded(flex: 2, child: Text(person.status)),
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
