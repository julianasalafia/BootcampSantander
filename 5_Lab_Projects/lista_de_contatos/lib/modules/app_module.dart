import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import 'package:lista_de_contatos/pages/main_page.dart';
import 'package:lista_de_contatos/pages/new_contact_form.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      mainPage,
      child: (context) => const MainPage(),
    );
    r.child(
      (newContactPage),
      child: (context) => const NewContactForm(),
    );
  }
}
