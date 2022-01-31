import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  final String _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RextClientException implements Exception {
  final int? code;
  final String message;

  RextClientException(
    this.code, {
    required this.message,
  });

  @override
  String toString() => 'RestClienteException: code = $code, message = $message';
}
