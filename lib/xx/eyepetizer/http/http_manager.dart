/// 方便理解，as http
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:imooc_flutter/xx/first/http/http_manager.dart';

class HttpManager {
  //防止中文乱码
  static var utf8Decoder = Utf8Decoder();

  /**
      HttpManager.getData("http://baobab.kaiyanapp.com/api/v2/feed?num=1",
      success:(result) {
      print('result=========$result');
      },
      fail: () {

      },
      complete: () {

      });
   *
   */

  static void getData(String url,
      {Map<String, String>? headers,
      required Function success,
      required Function fail,
      required Function complete}) async {
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
        var result = json.decode(utf8Decoder.convert(response.bodyBytes));
        success(result);
      } else {
        throw Exception('"Request failed with status: ${response.statusCode}"');
      }
    } catch (e) {
      fail(e);
    } finally {
      if (complete != null) {
        complete();
      }
    }
  }

  static Future requestData(String url, {Map<String, String>? headers}) async {
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var result = json.decode(utf8Decoder.convert(response.bodyBytes));
        return result;
      } else {
        throw Exception('"Request failed with status: ${response.statusCode}"');
      }
    } catch (e) {
      Future.error(e);
    }
  }
}
