import 'package:dio/dio.dart';
import 'package:weather_app_challenge/app/services/http/i_http_service.dart';
import 'package:weather_app_challenge/app/services/http/response.dart' as http;

class HttpServiceDio implements IHttpService {
  final Dio dio;

  HttpServiceDio()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://parseapi.back4app.com/parse/functions/',
            responseType: ResponseType.json,
            headers: {
              'X-Parse-Application-Id':
                  'nAX5VLA1WnL3qkzuYnlh4tzUqS9NJuKGL13L4vas',
              'X-Parse-REST-API-Key':
                  '3Q8wzFGU6isxalfOyagYkz2bu0lCTcrtgJ7Q4iD7',
              'X-Parse-Revocable-Session': '1',
            },
          ),
        );

  @override
  Future<http.Response> post({
    required String url,
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    try {
      final result = await dio.post(
        url,
        queryParameters: query,
        data: body,
      );

      return http.Response(data: result.data, statusCode: result.statusCode);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
