import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String endpoint = 'http://192.168.254.117';

class KycService {
  Dio dio = new Dio(new BaseOptions(
      baseUrl: endpoint,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000));

  KycService() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Future<Response> login(String username, String password) async {
    String path = '/login';

    return await dio.post(path, data: {
      "username": username,
      "password": password,
    });
  }

  Future<Response> getTruckLoads(String closeStatus, String token) async {
    String path = '/info';

    return await dio.get(path,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
  }
}
