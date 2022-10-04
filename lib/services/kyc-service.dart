import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String endpoint = 'http://192.168.254.117:3000';

class KycService {
  Dio dio = new Dio(new BaseOptions(
      baseUrl: endpoint,
      receiveDataWhenStatusError: true,
      connectTimeout: 5 * 60 * 1000,
      receiveTimeout: 3 * 60 * 1000));

  KycService() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Future<Response> createSession() async {
    String path = '/register/ekyc';
    return await dio.post(path, data: {});
  }

  Future<Response> login(String username, String password) async {
    String path = '/login';
    return await dio
        .post(path, data: {"username": username, "password": password});
  }

  Future<Response> completeSession(String sessionId) async {
    String path = '/register/ekyc/complete';
    return await dio.post(path, data: {"sessionId": sessionId});
  }

  Future<Response> uploadFace(String image, String sessionId) async {
    String path = '/register/ekyc/face';
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image, filename: 'face_kyc.png'),
      "sessionId": sessionId
    });

    return await dio.post(path, data: formData);
  }

  Future<Response> uploadFrontIDCard(String image, String sessionId) async {
    String path = '/register/ekyc/front';
    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(image, filename: 'front_idcard_kyc.png'),
      "sessionId": sessionId
    });

    return await dio.post(path, data: formData);
  }

  Future<Response> uploadBackIDCard(String image, String sessionId) async {
    String path = '/register/ekyc/back';
    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(image, filename: 'back_idcard_kyc.png'),
      "sessionId": sessionId
    });

    return await dio.post(path, data: formData);
  }
}
