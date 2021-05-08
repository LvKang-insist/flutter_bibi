/// @name：login_effect
/// @package：widget
/// @author：345 QQ:1831712732
/// @time：2021/05/08 10:41
/// @des：

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginEffect extends StatefulWidget {
  final bool protect;

  LoginEffect(this.protect);

  @override
  _LoginEffectState createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(true),
          Image.asset("images/logo.png", height: 50, width: 90),
          _image(false),
        ],
      ),
    );
  }

  _image(bool bool) {
    var headLeft = widget.protect
        ? "images/head_left_protect.png"
        : "images/head_left.png";
    var headRight = widget.protect
        ? "images/head_right_protect.png"
        : "images/head_right.png";
    return Image(height: 90, image: AssetImage(bool ? headLeft : headRight));
  }
}
