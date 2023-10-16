import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import '../repository/contact_repository.dart';
import '../store/contact_list_store.dart';

class MainPage extends StatefulWidget {
  final ContactRepository contactRepository;
  final ContactListStore contactListStore;
  const MainPage({
    super.key,
    required this.contactRepository,
    required this.contactListStore,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    widget.contactListStore.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          appBarTitle,
          style: TextStyle(color: Colors.blue),
        ),
        leading: const Icon(
          Icons.person_rounded,
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: widget.contactListStore,
                        builder: (context, value, child) {
                          return value.isLoading
                              ? const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Expanded(
                                  child: ListView.builder(
                                      itemCount: value.contacts.length,
                                      itemBuilder: (context, index) {
                                        final contact = value.contacts[index];
                                        return Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Expanded(
                                                  flex: 1,
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/empty_background.png'),
                                                    radius: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      ),
                                                      IconButton(
                                                        onPressed: () async {
                                                          await widget
                                                              .contactListStore
                                                              .delete(contact
                                                                  .objectId);
                                                          await widget
                                                              .contactListStore
                                                              .getContacts();
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                        }),
                    // Expanded(
                    //     child: Padding(
                    //   padding: const EdgeInsets.all(50.0),
                    //   child: Image.asset(backgroundImage),
                    // )),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        Modular.to.pushNamed(newContactPage);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
