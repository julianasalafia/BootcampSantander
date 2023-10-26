import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import 'package:lista_de_contatos/repository/contact_repository.dart';

import '../models/new_contact_form_model.dart';
import '../store/contact_list_store.dart';
import '../widgets/circle_avatar_picture_widget.dart';
import '../widgets/info_text_field_widget.dart';
import '../widgets/save_button_widget.dart';

class NewContactFormPage extends StatelessWidget {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final ContactListStore contactListStore;
  final ContactRepository contactRepository;
  final Contact? contact;

  NewContactFormPage({
    super.key,
    required this.contactListStore,
    required this.contactRepository,
    this.contact,
  }) {
    if (contact != null) {
      nameController.text = contact?.name ?? '';
      surnameController.text = contact?.surname ?? '';
      phoneController.text = contact?.phone ?? '';
      emailController.text = contact?.email ?? '';
    }
  }

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
          newContactTitle,
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          SaveButtonWidget(
            contactListStore: contactListStore,
            nameController: nameController,
            surnameController: surnameController,
            phoneController: phoneController,
            emailController: emailController,
            contactRepository: contactRepository,
            objectId: contact?.objectId,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
              child: Column(
                children: [
                  CircleAvatarPictureWidget(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      addImageMessage,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  InfoTextFieldWidget(
                    controller: nameController,
                    hint: name,
                    icon: const Icon(Icons.person_outline),
                  ),
                  InfoTextFieldWidget(
                    controller: surnameController,
                    hint: surname,
                    icon: const Icon(Icons.person_outline),
                  ),
                  InfoTextFieldWidget(
                    controller: phoneController,
                    hint: phone,
                    icon: const Icon(Icons.phone_outlined),
                  ),
                  InfoTextFieldWidget(
                    controller: emailController,
                    hint: email,
                    icon: const Icon(Icons.email_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
