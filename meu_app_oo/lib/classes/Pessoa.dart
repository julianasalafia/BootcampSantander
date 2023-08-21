class Pessoa {
  String? _nome;
  String? _endereco;

  void setNome(String nome) {
    _nome = nome;
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  String? getNome() {
    return _nome!.toUpperCase();
  }

  String? getEndereco() {
    return _endereco;
  }

  @override
  String toString() {
    return {"nome": _nome, "endereco": _endereco}.toString();
  }
}
