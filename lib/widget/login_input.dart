/// @name：login_input
/// @package：widget
/// @author：345 QQ:1831712732
/// @time：2021/05/07 17:26
/// @des：登录输入框

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bibi/widget/color.dart';

class LoginInput extends StatefulWidget {
  final String title;
  final String hint;
  final ValueChanged<String> changed;
  final ValueChanged<bool> focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType keboardType;

  LoginInput(this.title, this.hint,
      {this.changed,
      this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      this.keboardType});

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //光标监听
    _focusNode.addListener(() {
      if (widget.focusChanged != null) widget.focusChanged(_focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            _input(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: !widget.lineStretch ? 15 : 0),
          child: Divider(
            height: 1,
            thickness: 0.5,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _input() {
    return Expanded(
        child: TextField(
      focusNode: _focusNode,
      onChanged: widget.changed,
      obscureText: widget.obscureText,
      keyboardType: widget.keboardType,
      //是否获取焦点，如果不是密码输入，就获取焦点
      autofocus: !widget.obscureText,
      cursorColor: primary,
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
      //输入框样式
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hint ?? "",
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
    ));
  }
}
