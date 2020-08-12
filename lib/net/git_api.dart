import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/models/index.dart';
import 'package:shixin_flutter_app/net/interceptors/token_interceptor.dart';
import 'package:shixin_flutter_app/net/result_data.dart';
import 'package:shixin_flutter_app/util/data_utils.dart';
import 'global.dart';
import 'interceptors/log_interceptor.dart';
import 'package:http/http.dart' as http;
class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://backend.xiaoyang.iteratech.net/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
      HttpHeaders.contentTypeHeader: "application/json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
    dio.interceptors.add(_tokenInterceptors);
    dio.interceptors.add(new LogsInterceptors());
    dio.interceptors.add(LogInterceptor(responseBody: true));
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    /*if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY 10.95.241.180:8888";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }*/
  }

  //获取用户项目列表
  Future<String> login({
    Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
  }) async {
    var r = await dio.post(
      "user/login",
      queryParameters: queryParameters,
      options: _options,
    );
    return r.data;
  }

  //获取用户项目列表
  Future<List<Project>> getProjectsOfMine({
    Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
  }) async {
    queryParameters['status'] = 'active';
    var r = await dio.get(
      "project/mine",
      queryParameters: queryParameters,
      options: _options,
    );

    List<dynamic> list = json.decode(r.data);

    return list.map((e) => Project.fromJson(e)).toList();
  }

  // get请求的封装，传入的两个参数分别是请求URL和请求参数，请求参数以map的形式传入，会在方法体中自动拼接到URL后面
   Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    var header = await DataUtils.getHeader();
    http.Response res = await http.get(url,headers: header);
    return res.body;
  }
}
