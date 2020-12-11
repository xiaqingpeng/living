import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';


final String baseUrl = 'http://47.115.178.12:7001';

class HttpController {
  static post(api, params) async {
    print("开始获取数据");
    Response response;
    Dio dio = new Dio();

    try {
      // dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
      response = await dio.post(baseUrl + api, data: params);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端请求请求异常');
      }
    } catch (e) {}
  }

  static get(api, params) async {
    Options options = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json"});
    print("开始获取数据");
    Response response;
    Dio dio = new Dio();

    try {
      if (params != null && params.isNotEmpty) {
        
        var url = baseUrl + api;
       
        response = await dio.get(baseUrl + api + params);
        print(response);
       
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception('后端请求请求异常');
        }
      } else {
        response = await dio.get(baseUrl + api);
        print("$response  PPPPPPPPP");
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception('后端请求请求异常');
        }
      }
    } catch (e) {
      throw Exception('后台数据请求失败：$e');
    }
  }
}
