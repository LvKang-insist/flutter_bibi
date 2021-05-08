/// @name：string_utils
/// @package：utils
/// @author：345 QQ:1831712732
/// @time：2021/05/08 11:15
/// @des：

bool isNotEmpty(String text) {
  return text?.isNotEmpty ?? false;
}

bool isEmpty(String text) {
  return text?.isEmpty ?? true;
}