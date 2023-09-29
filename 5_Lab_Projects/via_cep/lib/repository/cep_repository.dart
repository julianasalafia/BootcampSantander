import 'package:dio/dio.dart';

import '../Model/cep_model.dart';

class CEPRepository {
  Future<CepModel> get() async {
    var dio = Dio();
    dio.options.headers['X-Parse-Application-Id'] =
        'PyxNck0mm0dcW0v843nMT1o6V9lQopjCUA1lC0O9';
    dio.options.headers['X-Parse-REST-API-Key'] =
        'b6ySS1gXMyuODiKh8XpklMsVTpX2Y4yGVZKoNK08';
    dio.options.headers['Content-Type'] = 'application/json';
    var result = await dio.get('https://parseapi.back4app.com/classes/CEP');
    return CepModel.fromJson(result.data);
  }
}
