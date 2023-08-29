class Pessoa {
  late String _nome;
  late double _peso;
  late double _altura;

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
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
