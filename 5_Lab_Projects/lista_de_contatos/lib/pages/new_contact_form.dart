import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';

class NewContactForm extends StatelessWidget {
  const NewContactForm({super.key});

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
                    // TODO: save contact
                  },
                  child: const Text(
                    saveButton,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person_outline),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name')),
                ),
                SizedBox(width: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
