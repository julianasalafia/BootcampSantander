import 'package:trilhaapp/repositories/back4app/back4app_custom_dio.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {
  final _customDio = Back4AppCustomDio();

  TarefasBack4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidos) async {
    var url = '/Tarefas';

    if (naoConcluidos) {
      url = '$url?where={\"concluido\":false}';
    }
    var result = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio
          .post('/Tarefas', data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.put('/Tarefas/${tarefaBack4AppModel.objectId}',
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _customDio.dio.delete('/Tarefas/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
