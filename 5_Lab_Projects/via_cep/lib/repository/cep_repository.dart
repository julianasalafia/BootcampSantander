import 'package:dio/dio.dart';

import '../Model/cep_model.dart';

class CEPRepository {
  var _dio = Dio();

  CEPRepository() {
    _dio = Dio();
    _dio.options.headers['X-Parse-Application-Id'] =
        'PyxNck0mm0dcW0v843nMT1o6V9lQopjCUA1lC0O9';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'b6ySS1gXMyuODiKh8XpklMsVTpX2Y4yGVZKoNK08';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<CepModel> get() async {
    var result = await _dio.get('/CEP');
    return CepModel.fromJson(result.data);
  }

  Future<void> create(
    bool isRegistered,
    String cep,
    String logradouro,
    String bairro,
    String cidade,
    String estado,
  ) async {
    var response = await _dio.post('/CEP', data: {
      'isRegistered': isRegistered,
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    });
    return response.data;
  }
}
