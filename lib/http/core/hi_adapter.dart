import 'dart:convert';
import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：hi_adapter
/// @package：http.core
/// @author：345 QQ:1831712732
/// @time：2021/05/06 15:41
/// @des：

/// 网络请求抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse> send(BaseRequest request);
}


///统一网络返回格式
class HiNetResponse {
  dynamic data;
  BaseRequest request;
  int statusCode;
  String statusMessage;
  dynamic extra;

  HiNetResponse(
      {this.data,
      this.request,
      this.statusCode,
      this.statusMessage,
      this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
