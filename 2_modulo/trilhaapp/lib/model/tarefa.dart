import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = '';
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  String getId() {
    return _id;
  }

  String getDescricao() {
    return _descricao;
  }

  String getConcluido() {
    return _descricao;
  }

  void setDescricao(String descricao) {
    _descricao = descricao;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }
}
