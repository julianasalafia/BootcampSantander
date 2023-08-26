class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String? get nome => _nome;
  double? get peso => _peso;
  double? get altura => _altura;

  set nome(String? nome) {
    _nome = nome!;
  }

  set peso(double? peso) {
    _peso = peso!;
  }

  set altura(double? altura) {
    _altura = altura!;
  }

  @override
  String toString() {
    return {
      'nome': _nome,
      'peso': _peso,
      'altura': _altura,
    }.toString();
  }
}
