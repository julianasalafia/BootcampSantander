import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import 'package:lista_de_contatos/widgets/dialog_response_widget.dart';

import '../models/new_contact_form_model.dart';
import '../pages/main_page.dart';

class ListViewCardWidget extends StatelessWidget {
  final String profilePicture;

  const ListViewCardWidget({
    super.key,
    required this.contact,
    required this.widget,
    required this.profilePicture,
  });

  final Contact contact;
  final MainPage widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage(profilePicture),
                radius: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${contact.name}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return DialogResponseWidget(
                              title: warningTitleDialog,
                              description: warningDeleteMessage,
                              onPressed: () async {
                                Modular.to.pushNamed(mainPage);

                                await widget.contactListStore
                                    .delete(contact.objectId);

                                await widget.contactListStore.getContacts();
                              },
                              cancelButtonText: cancelButton,
                            );
                          });
                    },
                    icon: const Icon(Icons.delete),
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
