abstract class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;

  void setNome(String nome) {
    _nome = nome;
  }

  String? getNome() {
    return _nome!;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double? getPeso() {
    return _peso!;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double? getAltura() {
    return _altura!;
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
