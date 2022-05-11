import 'package:dio/dio.dart';

class BaseHttpClient {
  final _client = Dio();

  static String get baseURL {
    const isProduction = bool.fromEnvironment('dart.vm.product');
    return isProduction ? 'https://newsapi.org/v2/' : 'https://newsapi.org/v2/';
  }

  Dio get client {
    _client.options.baseUrl = baseURL;
    _client.options.headers = {
      'Accept': 'application/json',
    };
    return _client;
  }

  Dio get authenticatedClient {
    final httpClient = client;
    httpClient.options.headers = {
      'Accept': 'application/json',
    };
    return httpClient;
  }
}
