import 'package:dio/dio.dart';
import 'dart:async';

Future request(url, {formData}) async {
    try {
        Response response;
        Dio dio = Dio();
        dio.options.contentType = Headers.formUrlEncodedContentType;

        response = await dio.post(url, data: formData);
        if (response.statusCode == 200) {
            print(response);
            return response;
        } else {
            throw Exception('接口请求失败！');
        }

    } catch (e) {
        return print('error:::$e');
    }
}