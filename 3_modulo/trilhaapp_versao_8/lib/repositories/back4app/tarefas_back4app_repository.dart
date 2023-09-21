import 'package:dio/dio.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {
  var _dio = Dio();

  TarefasBack4AppRepository() {
    _dio = Dio();
    _dio.options.headers['X-Parse-Application-Id'] =
        'qlyTA0QwIhtAIN4TZLYPD9bkpb7wrxc7vl1U1r8A';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'jXewZxAMPzeU8RLglBX9mfWdRZm4pGWzvLXmyTjX';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidos) async {
    var url = '/Tarefas';

    if (naoConcluidos) {
      url = '$url?where={\"concluido\":false}';
    }
    var result = await _dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.post('/Tarefas', data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.put('/Tarefas/${tarefaBack4AppModel.objectId}',
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _dio.delete('/Tarefas/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
