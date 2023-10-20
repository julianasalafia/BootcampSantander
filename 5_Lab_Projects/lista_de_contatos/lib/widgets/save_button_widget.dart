import 'package:flutter/material.dart';

import '../helper/constants.dart';
import '../store/contact_list_store.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.contactListStore,
    required this.nameController,
    required this.surnameController,
    required this.phoneController,
    required this.emailController,
  });

  final ContactListStore contactListStore;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
