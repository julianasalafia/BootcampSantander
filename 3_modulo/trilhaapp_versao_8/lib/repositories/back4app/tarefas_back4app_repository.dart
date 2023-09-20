import 'package:dio/dio.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {
  Future<TarefaBack4AppModel> obterTarefas() async {
    var dio = Dio();
    dio.options.headers['X-Parse-Application-Id'] =
        'qlyTA0QwIhtAIN4TZLYPD9bkpb7wrxc7vl1U1r8A';
    dio.options.headers['X-Parse-REST-API-Key'] =
        'jXewZxAMPzeU8RLglBX9mfWdRZm4pGWzvLXmyTjX';
    dio.options.headers['Content-Type'] = 'application/json';
    var result = await dio.get('https://parseapi.back4app.com/classes/Tarefas');
    return TarefaBack4AppModel.fromJson(result.data);
  }
}
