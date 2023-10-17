import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import 'package:lista_de_contatos/pages/main_page.dart';
import 'package:lista_de_contatos/pages/new_contact_form.dart';
import 'package:lista_de_contatos/repository/contact_repository.dart';
import 'package:lista_de_contatos/store/contact_list_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(ContactRepository.new);
    i.addSingleton(ContactListStore.new);
  }

  @override
  void routes(r) {
    r.child(
      mainPage,
      child: (context) => MainPage(
        contactRepository: Modular.get(),
        contactListStore: Modular.get(),
      ),
    );
    r.child(
      (newContactPage),
      child: (context) => NewContactForm(
        contactListStore: Modular.get(),
      ),
    );
  }
}
