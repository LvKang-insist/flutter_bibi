import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @name：toast
/// @package：utils
/// @author：345 QQ:1831712732
/// @time：2021/05/08 11:56
/// @des：

showWarnToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
  );
}