import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/models/new_contact_form_model.dart';
import 'package:lista_de_contatos/repository/contact_repository.dart';
import 'package:lista_de_contatos/widgets/text_shared_widget.dart';

import '../helper/constants.dart';

class ContactInfoPage extends StatelessWidget {
  final contactRepository = ContactRepository();
  final Contact contact;

  ContactInfoPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.blue,
            onPressed: () {
              Modular.to.pushNamed(mainPage);
            },
            icon: const Icon(Icons.close)),
        title: const Text(
          contactTitle,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/empty_background.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              children: [
                const Column(
                  children: [
                    Icon(Icons.person_outline),
                    SizedBox(height: 10),
                    Icon(Icons.phone_outlined),
                    SizedBox(height: 10),
                    Icon(Icons.email_outlined),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSharedWidget.titleApp(
                        '${contact.name} ${contact.surname}'),
                    const SizedBox(height: 10),
                    TextSharedWidget.textApp('${contact.phone}'),
                    const SizedBox(height: 10),
                    TextSharedWidget.textApp('${contact.email}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
