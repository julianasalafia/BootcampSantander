import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';

import '../store/contact_list_store.dart';
import '../widgets/circle_avatar_picture_widget.dart';
import '../widgets/info_text_field_widget.dart';
import '../widgets/save_button_widget.dart';

class NewContactForm extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final ContactListStore contactListStore;

  NewContactForm({super.key, required this.contactListStore});

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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
            InfoTextFieldWidget(controller: nameController, hint: name),
            InfoTextFieldWidget(controller: surnameController, hint: surname),
            InfoTextFieldWidget(controller: phoneController, hint: phone),
            InfoTextFieldWidget(controller: emailController, hint: email),
          ],
        ),
      ),
    );
  }
}
