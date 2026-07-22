import 'package:dio/dio.dart';

class ApiServices {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      followRedirects: true,
      validateStatus: (status) {
        return status != null && status < 300;
      },
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Response> get(String endpoint, {dynamic data}) async {
    return await dio.get(endpoint, queryParameters: data);
  }

  static Future<Response> post(
    String endpoint,
    dynamic data, {
    bool isFormData = false,
    ProgressCallback? onSendProgress,
  }) async {
    final requestData = _formatData(data, isFormData);

    return await dio.post(
      endpoint,
      data: requestData,
      onSendProgress: onSendProgress,
    );
  }

  static Future<Response> delete(String endpoint) async {
    return await dio.delete(endpoint);
  }

  static dynamic _formatData(dynamic data, bool isFormData) {
    if (isFormData && data is Map<String, dynamic>) {
      return FormData.fromMap(data);
    }
    return data;
  }
}
