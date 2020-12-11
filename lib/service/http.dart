import 'dart:convert';
import 'package:http/http.dart' as http;

final String baseUrl = 'http://47.115.178.12:7001';

class HttpController {
  static void get(String api, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    var url = baseUrl + api;
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      http.Response res = await http.get(url);
      if (callback != null) {
        callback(res.body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  static void post(String api, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    var url = baseUrl + api;
    try {
      http.Response res = await http.post(url, body: params);

      if (callback != null) {
        callback(res.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
