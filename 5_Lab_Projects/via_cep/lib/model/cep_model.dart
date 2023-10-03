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
  String objectId = '';
  String cep = '';
  bool isRegistered = false;
  String createdAt = '';
  String updatedAt = '';
  String logradouro = '';
  String complemento = '';
  String bairro = '';
  String cidade = '';
  String estado = '';

  Cep(
      this.objectId,
      this.cep,
      this.isRegistered,
      this.createdAt,
      this.updatedAt,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado);

  Cep.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    isRegistered = json['isRegistered'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['isRegistered'] = isRegistered;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    return data;
  }
}
