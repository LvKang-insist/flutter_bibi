import 'package:flutter_bibi/http/core/hi_adapter.dart';
import 'package:flutter_bibi/http/request/base_request.dart';

/// @name：mock_adapter
/// @package：http.core
/// @author：345 QQ:1831712732
/// @time：2021/05/06 16:07
/// @des：

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send(BaseRequest request) {
    return Future.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(data: {"code": 0}, statusCode: 200);
    });
  }
}
