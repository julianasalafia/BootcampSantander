import 'package:dio/dio.dart';
import '../models/new_contact_form_model.dart';

class ContactRepository {
  var _dio = Dio();

  ContactRepository() {
    _dio = Dio();

    _dio.options.headers['X-Parse-Application-Id'] =
        'pJgRZxfFDD380EhaOZSeudpurl5J3sUsq0kDO5xg';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        '5ONRHlCKM7X9gPu54LwRLlK3qHC8bejbt8EWfxfS';
    _dio.options.headers['Content-Type'] = 'application/json';
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

  Future<void> delete(String objectId) async {
    try {
      await _dio.delete('/Contacts/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
