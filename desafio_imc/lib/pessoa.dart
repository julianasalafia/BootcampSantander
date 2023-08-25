class Pessoa {
  String? _nome;
  String? _peso;
  String? _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String? get nome => _nome;
  String? get peso => _peso;
  String? get altura => _altura;

  set nome(String? nome) {
    _nome = nome!;
  }

  set peso(String? peso) {
    _peso = peso!;
  }

  set altura(String? altura) {
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
