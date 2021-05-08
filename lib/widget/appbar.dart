import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// @name：appbar
/// @package：widget
/// @author：345 QQ:1831712732
/// @time：2021/05/07 21:45
/// @des：

appbar(String title, String rightTitle, VoidCallback rightButton) {
  return AppBar(
    centerTitle: false,
    titleSpacing: 0,
    leading: BackButton(),
    title: Text(title, style: TextStyle(fontSize: 18)),
    actions: [
      InkWell(
        onTap: rightButton,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(rightTitle,
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              textAlign: TextAlign.center),
        ),
      )
    ],
  );
}
