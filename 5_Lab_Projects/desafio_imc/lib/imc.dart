import 'package:desafio_imc/shared/categoria_imc.dart';

class IMC {
  double? _imc;

  double? get imc => _imc;

  set imc(double? imc) {
    _imc = imc!;
  }

  static String getDescricaoCategoriaIMC(CategoriaIMC categoria) {
    switch (categoria) {
      case CategoriaIMC.magrezaGrave:
        return 'magreza grave';
      case CategoriaIMC.magrezaModerada:
        return 'magreza moderada';
      case CategoriaIMC.magrezaLeve:
        return 'magreza leve';
      case CategoriaIMC.saudavel:
        return 'saudável';
      case CategoriaIMC.sobrepeso:
        return 'sobrepeso';
      case CategoriaIMC.obesidadeGrauI:
        return 'obesidade grau I';
      case CategoriaIMC.obesidadeGrauII:
        return 'obesidade grau II';
      case CategoriaIMC.obesidadeGrauIII:
        return 'obesidade grau III';
      default:
        throw ArgumentError('Categoria inválida');
    }
  }

  static CategoriaIMC getCategoriaIMC(double imc) {
    if (imc < 16) {
      return CategoriaIMC.magrezaGrave;
    } else if (imc < 17) {
      return CategoriaIMC.magrezaModerada;
    } else if (imc < 18.5) {
      return CategoriaIMC.magrezaLeve;
    } else if (imc < 25) {
      return CategoriaIMC.saudavel;
    } else if (imc < 30) {
      return CategoriaIMC.sobrepeso;
    } else if (imc < 35) {
      return CategoriaIMC.obesidadeGrauI;
    } else if (imc < 40) {
      return CategoriaIMC.obesidadeGrauII;
    } else {
      return CategoriaIMC.obesidadeGrauIII;
    }
  }

  static double calculateIMC({required double height, required double weight}) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  String toString() {
    return 'IMC: $_imc';
  }
}
