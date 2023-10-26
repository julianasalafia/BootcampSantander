import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_contatos/helper/constants.dart';
import '../repository/contact_repository.dart';
import '../store/contact_list_store.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/circular_center_progress_widget.dart';
import '../widgets/empty_background_widget.dart';
import '../widgets/list_view_card_widget.dart';
import '../widgets/main_floating_action_button_widget.dart';

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
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.contactListStore.getContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
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
                            ? const CircularCenterProgressWidget()
                            : value.contacts.isEmpty
                                ? const EmptyBackgroundWidget()
                                : Expanded(
                                    child: ListView.builder(
                                        itemCount: value.contacts.length,
                                        itemBuilder: (context, index) {
                                          final contact = value.contacts[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Modular.to.pushNamed(
                                                  contactInfoPage,
                                                  arguments:
                                                      value.contacts[index]);
                                            },
                                            child: ListViewCardWidget(
                                              contact: contact,
                                              widget: widget,
                                              profilePicture:
                                                  'assets/empty_background.png',
                                            ),
                                          );
                                        }),
                                  );
                      },
                    ),
                  ],
                ),
              ),
              const MainFloatingActionButtonWidget(
                icon: Icon(Icons.add),
                page: newContactPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
