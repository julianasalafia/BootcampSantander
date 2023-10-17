import 'package:dio/dio.dart';

class RequestUtils {
  static BaseOptions buildHeaders() {
    return BaseOptions(
      headers: {
        'X-Parse-Application-Id': 'pJgRZxfFDD380EhaOZSeudpurl5J3sUsq0kDO5xg',
        'X-Parse-REST-API-Key': '5ONRHlCKM7X9gPu54LwRLlK3qHC8bejbt8EWfxfS',
        'Content-Type': 'application/json',
      },
    );
  }
}
