import 'package:dio/dio.dart';
import 'package:flutter_bibi/http/core/hi_adapter.dart';
import 'package:flutter_bibi/http/core/hi_error.dart';
import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：dio_adapter
/// @package：http.core
/// @author：345 QQ:1831712732
/// @time：2021/05/07 09:59
/// @des：
class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send(BaseRequest request) async {
    var response;
    var option = Options(headers: request.header);
    var dio = Dio();
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        responseHeader: false,
        requestHeader: true));
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = dio.get(request.url(), options: option);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response =
            dio.post(request.url(), data: request.params, options: option);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response =
            dio.delete(request.url(), data: request.params, options: option);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {
      throw HiNetError(response?.hashCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }

  HiNetResponse buildRes(Response response, BaseRequest request) =>
      HiNetResponse(
          data: response.data,
          request: request,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          extra: response);
}
