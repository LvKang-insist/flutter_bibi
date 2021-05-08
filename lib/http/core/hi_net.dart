import 'package:flutter/material.dart';
import 'package:flutter_bibi/http/core/dio_adapter.dart';
import 'package:flutter_bibi/http/core/hi_adapter.dart';
import 'package:flutter_bibi/http/core/hi_error.dart';
import 'package:flutter_bibi/http/core/mock_adapter.dart';
import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：hi_net
/// @package：http.request
/// @author：345 QQ:1831712732
/// @time：2021/05/06 14:41
/// @des：
class HiNet {
  HiNet._();

  static HiNet _instance;

  static HiNet getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async{
    HiNetResponse response;
    var error;
    try {
      response  = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
    }

    var result = response.data;
    printLog(result);

    // var status = response.statusCode;
    // switch (status) {
    //   case 200:
    //     break;
    //   case 401:
    //     throw NeedLogin();
    //     break;
    //   case 403:
    //     throw NeedAuth("授权错误");
    //   default:
    //     throw HiNetError(status, result.toString(), data: result);
    // }
    return result;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url:${request.url()}');
    print('method:${request.httpMethod()}');
    return DioAdapter().send(request);
  }

  printLog(log) {
    print('hi_net：${log.toString()}');
  }
}
