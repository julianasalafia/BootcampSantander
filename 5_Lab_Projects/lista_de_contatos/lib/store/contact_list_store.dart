import 'package:flutter/cupertino.dart';
import 'package:lista_de_contatos/repository/contact_repository.dart';

import '../models/new_contact_form_model.dart';

class ContactListState {
  final List<Contact> contacts;
  final bool isLoading;

  ContactListState._({required this.contacts, required this.isLoading});

  factory ContactListState.initial() {
    return ContactListState._(contacts: [], isLoading: false);
  }

  ContactListState copyWith({List<Contact>? contacts, bool? isLoading}) {
    return ContactListState._(
        contacts: contacts ?? this.contacts,
        isLoading: isLoading ?? this.isLoading);
  }
}

class ContactListStore extends ValueNotifier<ContactListState> {
  final ContactRepository contactRepository;

  ContactListStore(this.contactRepository) : super(ContactListState.initial());

  Future<void> getContacts() async {
    value = value.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));

    final contacts = await contactRepository.getContactList();
    value = value.copyWith(contacts: contacts, isLoading: false);
  }

  Future<void> create(
      String name, String surname, String phone, String email) async {
    await contactRepository.create(name, surname, phone, email);
  }

  Future<void> delete(String objectId) async {
    await contactRepository.delete(objectId);
  }
}
