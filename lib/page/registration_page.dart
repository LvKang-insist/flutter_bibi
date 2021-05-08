/// @name：registration_page
/// @package：page
/// @author：345 QQ:1831712732
/// @time：2021/05/07 17:47
/// @des：

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bibi/widget/appbar.dart';
import 'package:flutter_bibi/widget/login_effect.dart';
import 'package:flutter_bibi/widget/login_input.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("注册", "登录", () {}),
      body: Container(
        child: ListView(
          //自适应键盘，防止遮挡
          children: [
            LoginEffect(protect),
            LoginInput(
              "用户名",
              "请输入用户名",
              changed: (value) {
                print(value);
              },
            ),
            LoginInput(
              "密码",
              "请输入密码",
              obscureText: true,
              lineStretch: true,
              changed: (value) {
                print(value);
              },
              focusChanged: (focus) => setState(() => protect = focus),
            )
          ],
        ),
      ),
    );
  }
}
