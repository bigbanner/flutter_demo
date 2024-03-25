import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/constants/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWork {
  static const bool _debug = true;
  //网易新闻的host
  static String NETEAST_HOST = "http://c.m.163.com/";
  // 新浪图片的host
  static String SINA_PHOTO_HOST = 'http://api.sina.cn/sinago';
  // 天气预报
  static String WEATHER_HOST = 'http://wthrcdn.etouch.cn';

  String getHost(int type) {
    switch (type) {
      case Constants.TYPE_NET_NETEASE_NEWS:
        return NETEAST_HOST;
      case Constants.TYPE_NET_SINA_NEWS:
        return SINA_PHOTO_HOST;
      case Constants.TYPE_NET_WEATHER_INFO:
        return WEATHER_HOST;
      default:
        return '';
    }
  }

  /* 基础GET请求 */
  static Future<String> get(String url, {Map<String, String>? params}) async {
    if (params != null && params.isNotEmpty) {
      Uri uri = Uri.parse(url);
      final uriWithParams = uri.replace(queryParameters: params);
      url = uriWithParams.toString();
    }

    http.Response res =
        await http.get(Uri.parse(url), headers: getCommonHeader());
    if (_debug) {
      print('_____________________');
      print('|发起Get请求|');
      print('|请求URL：$url|');
      print('|返回数据：${res.body}|');
      print('|_____________________|');
    }
    return res.body;
  }

/* 基础POST请求 */
  static Future<String> post(String url,
      {required Map<String, String> params}) async {
    http.Response res = await http.post(Uri.parse(url),
        body: params, headers: getCommonHeader());
    if (_debug) {
      print('_____________________');
      print('|发起Post请求|');
      print('|请求URL：$url|');
      print('|请求数据：${params.toString()}|');
      print('|返回数据：${res.body}|');
      print('|_____________________|');
    }
    return res.body;
  }

  static Map<String, String> getCommonHeader() {
    String? token = TokenManager().token;
    String encodedString = base64Encode(utf8.encode('saber:saber_secret'));
    // Map<String, String> header={}
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Basic $encodedString',
      "Host": 'www.rpasys.com',
      'App-Code':'0eluq284',
      'Blade-Auth': 'bearer $token',
    };
    header['User-Agent'] =
        'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36';
    
    print('header: $header');
    return header;
  }

  static Future<dynamic> getRequest(String url,{Map<String, dynamic>? queryParams}) async {
    var uri =  Uri.parse(url);
    if(queryParams!=null){
      uri = uri.replace(queryParameters: queryParams);
    }
   
    try {
      final response =
          await http.get(uri, headers: getCommonHeader(),);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  static Future<dynamic> postRequest(String url,
     {Map<String, dynamic>? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: getCommonHeader(),
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        String data = response.body;
        return json.decode(data);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }
}
