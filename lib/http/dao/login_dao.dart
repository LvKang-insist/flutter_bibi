import 'package:flutter_bibi/http/core/hi_net.dart';
import 'package:flutter_bibi/http/request/base_request.dart';
import 'package:flutter_bibi/http/request/login_request.dart';
import 'package:flutter_bibi/http/request/registration_request.dart';

/// @name：login_dao
/// @package：http.dao
/// @author：345 QQ:1831712732
/// @time：2021/05/07 14:29
/// @des：

class LoginDao {
  static login(String userName, String password) {
    return _send(userName, password);
  }

  static registration(
      String userName, String password, String imoocId, String orderId) {
    return _send(userName, password, imoocId: imoocId, orderId: orderId);
  }

  static _send(String userName, String password,
      {String imoocId, String orderId}) async {
    BaseRequest request;
    if (imoocId != null && orderId != null) {
      request = RegistrationRequest();
    } else {
      request = LoginRequest();
    }
    request
        .add("userName", userName)
        .add("password", password)
        .add("imoocId", imoocId)
        .add("orderId", orderId);
    var result = await HiNet.getInstance().fire(request);
    print(result);
  }
}
