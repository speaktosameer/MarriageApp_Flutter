import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exception.dart';

class Apiclient {
  Future request(
      {Map<String, dynamic> data = const {},
      required String endpoint,
      String method = 'get'}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accesstoken = prefs.getString('token');
    final dio = Dio(
      BaseOptions(
        baseUrl: Config.basurl,
        headers: {
          'Authorization': 'Bearer $accesstoken',
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    try {
      final response = method == 'get'
          ? await dio.get(endpoint)
          : await dio.post(
              endpoint,
              data: data,
            );

      return response.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}

final apiclientprovider = Provider<Apiclient>((ref) {
  return Apiclient();
});
