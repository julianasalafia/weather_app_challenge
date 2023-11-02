import 'package:weather_app_challenge/app/services/http/response.dart';

abstract class IHttpService {
  Future<Response> post({
    required String url,
    dynamic body,
    Map<String, dynamic>? query,
  });
}
