import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';

class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String? _baseUrl;
  String? _apiKey;

  HttpService() {
    AppConfig _config = getIt.get<AppConfig>();
    _apiKey = _config.API_KEY;
    _baseUrl = _config.BASE_API_URL;
  }

  Future<Response> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String _url = '$_baseUrl$_path';
      Map<String, dynamic> _query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      print('Unable to perform get request');
      print('DioError:$e');
    }
    throw '';
  }
}
