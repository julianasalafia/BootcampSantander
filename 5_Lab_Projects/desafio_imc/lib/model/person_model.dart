class PersonModel {
  final String id;
  final String name;
  final String? weight;
  final String? height;
  final double imc;
  final String status;

  PersonModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.imc,
    required this.status,
  });

  factory PersonModel.create({
    required name,
    required weight,
    required height,
    required imc,
    required status,
  }) {
    return PersonModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      weight: weight,
      height: height,
      imc: imc,
      status: status,
    );
  }

  factory PersonModel.fromJson(Map json) {
    return PersonModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      weight: json['weight'] ?? '',
      height: json['height'] ?? '',
      imc: json['imc'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'height': height,
      'imc': imc,
      'status': status,
    };
  }
}

class Person {
  String _name;
  double _weight;
  double _height;
  double _imc;

  Person(this._name, this._weight, this._height, this._imc);

  String get name => _name;
  double get weight => _weight;
  double get height => _height;
  double get imc => _imc;

  set name(String name) {
    _name = name;
  }

  set weight(double weight) {
    _weight = weight;
  }

  set height(double height) {
    _height = height;
  }

  set imc(double imc) {
    _imc = imc;
  }

  @override
  String toString() {
    return {
      'nome': _name,
      'peso': _weight,
      'altura': _height,
      'imc': _imc,
    }.toString();
  }
}
