class IMC {
  double? _peso;
  double? _altura;

  IMC(this._peso, this._altura);

  double? get peso => _peso;
  double? get altura => _altura;

  set peso(double? peso) {
    _peso = peso!;
  }

  set altura(double? altura) {
    _altura = altura!;
  }
}
