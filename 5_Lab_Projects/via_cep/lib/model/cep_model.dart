class CepModel {
  List<Cep> ceps = [];

  CepModel(this.ceps);

  CepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <Cep>[];
      json['results'].forEach((v) {
        ceps.add(Cep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((v) => v.toJson()).toList();
    return data;
  }
}

class Cep {
  String? cep;
  bool? isRegistered;
  String? createdAt;
  String? updatedAt;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  final String objectId;

  Cep(
    this.cep,
    this.isRegistered,
    this.createdAt,
    this.updatedAt,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado, {
    required this.objectId,
  });

  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
        json['cep'] ?? '',
        json['isRegistered'] ?? false,
        json['createdAt'] ?? '',
        json['updatedAt'] ?? '',
        json['logradouro'] ?? '',
        json['complemento'] ?? '',
        json['bairro'] ?? '',
        json['cidade'] ?? '',
        json['estado'] ?? '',
        objectId: json['objectId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'isRegistered': isRegistered,
      'cep': cep,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }
}
