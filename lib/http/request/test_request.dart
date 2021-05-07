import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：test_request
/// @package：http.request
/// @author：345 QQ:1831712732
/// @time：2021/05/06 14:37
/// @des：
class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() => HttpMethod.GET;

  @override
  bool needLogin() => false;

  @override
  String path() => "uapi/test/test";
}
