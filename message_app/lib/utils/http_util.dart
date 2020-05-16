import 'package:dio/dio.dart';
import 'dart:async';
import 'package:message_app/utils/restful_http_response.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtil {
  /// global dio object
  static Dio _dio;

  /// default options
  static const String API_PREFIX = 'http://api.huifuwu.cn/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 30000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  ///Get请求测试
  static Future<RestfulHttpResponse> get(String path,
      {Map<String, dynamic> queryParameters,
      Map<String, dynamic> headers}) async {
    Response<Map<String, dynamic>> response = await HttpUtil.createInstance()
        .get(path,
            queryParameters: queryParameters,
            options: Options(headers: headers));

    return RestfulHttpResponse.parseHttpReponse(
        response.statusCode, response.data);
  }

  ///Post请求测试
  static Future<RestfulHttpResponse> post(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> bodyParameters,
    Map<String, dynamic> headers,
  }) async {
    try {
      Response<Map<String, dynamic>> response = await HttpUtil.createInstance()
          .post(path,
              data: bodyParameters,
              queryParameters: queryParameters,
              options: Options(headers: headers));

      return RestfulHttpResponse.parseHttpReponse(
          response.statusCode, response.data);
    } catch (e) {
      print(e);
    }

    return null;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: API_PREFIX,
      );

      _dio = new Dio(options);
    }

    return _dio;
  }

  /// 清空 dio 对象
  static clear() {
    _dio = null;
  }
}
