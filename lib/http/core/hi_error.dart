/// @name：hi_error
/// @package：http.core
/// @author：345 QQ:1831712732
/// @time：2021/05/06 15:36
/// @des：异常

///授权异常
class NeedLogin extends HiNetError {
  NeedLogin({int code = 403, String message: '请先登录'}) : super(code, message);
}

///登录异常
class NeedAuth extends HiNetError {
  NeedAuth(String message, {int code = 401, dynamic data})
      : super(code, message, data: data);
}

class HiNetError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  HiNetError(this.code, this.message, {this.data});
}
