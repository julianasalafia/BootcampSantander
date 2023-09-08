import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return TarefaHiveRepository._criar();
  }

  void salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add('tarefaHiveModel');
  }

  List<TarefaHiveModel> obterDados() {
    return _box.values.cast<TarefaHiveModel>().toList();
  }
}
