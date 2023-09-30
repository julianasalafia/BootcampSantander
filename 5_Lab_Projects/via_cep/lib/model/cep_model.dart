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

  Cep(this.objectId, this.cep, this.isRegistered, this.createdAt,
      this.updatedAt);

  Cep.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    isRegistered = json['isRegistered'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['isRegistered'] = isRegistered;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
