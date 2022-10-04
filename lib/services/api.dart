import 'package:dio/dio.dart';

class Api {
  Dio dio = new Dio();
  Api() {}

  Future getUsers() async {
    String url = 'https://randomuser.me/api/?results=10';
    return await dio.get(url);
  }
}
