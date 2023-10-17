import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/app_colors.dart';
import 'package:lista_de_contatos/helper/constants.dart';

import '../store/contact_list_store.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
              ),
              child: TextButton(
                  onPressed: () {
                    contactListStore.create(
                      nameController.text,
                      surnameController.text,
                      phoneController.text,
                      emailController.text,
                    );
                  },
                  child: const Text(
                    saveButton,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                CircleAvatar(
                    backgroundColor: AppColors.lightBlue,
                    maxRadius: 80,
                    minRadius: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.black54,
                        size: 50,
                      ),
                    )),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Adicionar imagem',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person_outline),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name')),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 40),
                Expanded(
                  child: TextField(
                      controller: surnameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Surname')),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Phone')),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.email_outlined),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email')),
                ),
                const SizedBox(width: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
