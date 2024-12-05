import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

enum Method {
  post,
  get,
  put,
  delete,
}

class ApiService {
  ApiService({required this.dio});

  final Dio dio;

  Future<bool> checkConnection() async {
    final connection = await Connectivity().checkConnectivity();

    if (connection.contains(ConnectivityResult.mobile) ||
        connection.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> request(String path, {
    Method method = Method.get,
    bool setToken = true,
    Object? data,

    Map<String, Object?>? queryParams,
    Map<String, Object?>? headers,
    FormData? formData,
  }) async {
    final requestheadrs = {
      ...?headers,
      "content-type ": formData != null
          ? "multipart/form-data"
          : "application/json",
    };
    final response = await dio.request(
        path,
        data: data ?? formData,
        queryParameters: queryParams,
        options: Options(
          method: method.name,
          headers: requestheadrs,
        )
    );
    if (response.statusCode == null || response.statusCode! > 204 ||
        response.data == null) {
      throw Exception("API error");
    }
    return jsonEncode(response.data);
  }
}