import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：registration_request
/// @package：http.request
/// @author：345 QQ:1831712732
/// @time：2021/05/07 14:26
/// @des：

class RegistrationRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() => HttpMethod.POST;

  @override
  bool needLogin() => false;

  @override
  String path() => "/uapi/user/registration";
}
