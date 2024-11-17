import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://exercisedb.p.rapidapi.com/exercises',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "x-rapidapi-host": "exercisedb.p.rapidapi.com",
      "x-rapidapi-key": "91469f9336msh27f3fa57b7afc7ap1e4cccjsn8344816162b2",  // Replace with your actual API key
    };

    return await dio.get(
      url,
      queryParameters: query??null,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization': token??'',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data!,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization': token??'',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}