import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/widgets/dialog_response_widget.dart';

import '../helper/constants.dart';
import '../repository/contact_repository.dart';
import '../store/contact_list_store.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.contactListStore,
    required this.contactRepository,
    required this.nameController,
    required this.surnameController,
    required this.phoneController,
    required this.emailController,
  });

  final ContactListStore contactListStore;
  final ContactRepository contactRepository;
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
            if (nameController.text.isEmpty || phoneController.text.isEmpty) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return DialogResponseWidget(
                      title: warningTitleDialog,
                      description: warningMessage,
                      onPressed: () => Navigator.pop(context),
                      cancelButtonText: voidMessage,
                    );
                  });
            }

            if (nameController.text.isNotEmpty &&
                phoneController.text.isNotEmpty) {
              contactListStore.create(
                nameController.text,
                surnameController.text,
                phoneController.text,
                emailController.text,
              );

              showDialog(
                  context: context,
                  builder: (_) {
                    return DialogResponseWidget(
                        title: successfulTitleDialog,
                        description: successfulMessageDialog,
                        cancelButtonText: null,
                        onPressed: () async {
                          await Modular.to.pushNamed(mainPage);
                        });
                  });
            }
          },
          child: const Text(
            saveButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
