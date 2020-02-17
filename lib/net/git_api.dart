import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shixin_flutter_app/net/interceptors/token_interceptor.dart';
import 'package:shixin_flutter_app/net/result_data.dart';
import 'global.dart';
import 'interceptors/log_interceptor.dart';

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
    baseUrl: 'http://backend.xiaoyang.dongan-tech.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
      HttpHeaders.contentTypeHeader:"application/json",
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
  Future<String> login(
      {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
      }) async {
    var r = await dio.post(
      "user/login",
      queryParameters: queryParameters,
      options: _options,
    );
    return r.data;
  }

}
