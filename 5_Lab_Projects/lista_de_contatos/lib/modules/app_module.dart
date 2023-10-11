import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/pages/main_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MainPage());
  }
}
