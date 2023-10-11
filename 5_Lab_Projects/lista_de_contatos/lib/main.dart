import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/modules/app_module.dart';
import 'package:lista_de_contatos/modules/app_widget.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'pJgRZxfFDD380EhaOZSeudpurl5J3sUsq0kDO5xg';
  const keyClientKey = 'adGqffkexs9dbn2giKhJU2RrPNymda77K6XhL8IS';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
