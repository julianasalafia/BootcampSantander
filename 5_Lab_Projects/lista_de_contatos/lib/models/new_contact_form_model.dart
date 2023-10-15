class NewContactFormModel {
  List<Contact> contacts = [];

  NewContactFormModel(this.contacts);

  NewContactFormModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contacts = <Contact>[];
      json['results'].forEach((v) {
        contacts.add(Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = contacts.map((v) => v.toJson()).toList();
    return data;
  }
}

class Contact {
  final String objectId;
  String? photo;
  String? name;
  String? surname;
  String? phone;
  String? email;
  String? createdAt;
  String? updatedAt;

  Contact({
    required this.objectId,
    this.photo,
    this.name,
    this.surname,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      objectId: json['objectId'],
      photo: json['photo'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'photo': photo,
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
