import 'package:dio/dio.dart';
import 'package:lista_de_contatos/utils/request_utils.dart';
import '../models/new_contact_form_model.dart';

class ContactRepository {
  final _dio = Dio();

  ContactRepository() {
    _dio.options = RequestUtils.buildHeaders();
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<NewContactFormModel> get() async {
    var result = await _dio.get('/Contacts');
    return NewContactFormModel.fromJson(result.data);
  }

  Future<List<Contact>> getContactList() async {
    try {
      var result = await _dio.get('/Contacts');
      List<dynamic> data = result.data['results'];
      return (data).map((e) => Contact.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return [];
    } catch (e) {
      print('Error: $e.');
      return [];
    }
  }

  Future<void> create(
    String name,
    String surname,
    String phone,
    String email,
  ) async {
    var response = await _dio.post('/Contacts', data: {
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
    });
    return response.data;
  }

  Future<void> update(
    String name,
    String surname,
    String phone,
    String email, {
    required String objectId,
  }) async {
    var response = await _dio.put('/Contacts/$objectId', data: {
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
    });
    return response.data;
  }

  Future<void> delete(String objectId) async {
    try {
      await _dio.delete('/Contacts/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
