

import 'package:dio/dio.dart';

class ProductsHelper {
  ProductsHelper._();
  static ProductsHelper instance = ProductsHelper._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      headers: {
        "Content-Type": "application/json",
        "lang": "en",
      },
    ),
  );

  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParams,
      );
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }
}
