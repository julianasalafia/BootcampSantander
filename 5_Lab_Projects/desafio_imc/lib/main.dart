import 'package:desafio_imc/modules/app_module.dart';
import 'package:desafio_imc/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('result');

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
