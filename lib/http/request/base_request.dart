/// @name：base_request
/// @package：http.request
/// @author：345 QQ:1831712732
/// @time：2021/05/06 14:11
/// @des：
enum HttpMethod {
  GET,
  POST,
  DELETE,
}

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  ///域名
  String authority() {
    return "api.devio.org";
  }

  ///请求方法
  HttpMethod httpMethod();

  ///请求路径
  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith('/')) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    useHttps == true
        ? uri = Uri.https(authority(), pathStr, params)
        : uri = Uri.http(authority(), pathStr, params);

    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = Map();
  Map<String, dynamic> header = Map();

  ///添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v;
    return this;
  }

  ///添加参数
  BaseRequest addHeader(String k, Object v) {
    header[k] = v;
    return this;
  }
}
