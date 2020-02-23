import 'package:dio/dio.dart';
import 'package:shixin_flutter_app/common/LogUtil.dart';
import 'package:shixin_flutter_app/config/config.dart';

/**
 * Log 拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    if (Config.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Config.DEBUG) {
      if (response != null) {
        LogUtil.v('返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) async {
    if (Config.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err; // continue;
  }
}
