/// @name：login_page
/// @package：page
/// @author：345 QQ:1831712732
/// @time：2021/05/08 11:31
/// @des：

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bibi/http/dao/login_dao.dart';
import 'package:flutter_bibi/utils/string_utils.dart';
import 'package:flutter_bibi/utils/toast.dart';
import 'package:flutter_bibi/widget/appbar.dart';
import 'package:flutter_bibi/widget/login_button.dart';
import 'package:flutter_bibi/widget/login_effect.dart';
import 'package:flutter_bibi/widget/login_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName;
  String passWord;
  bool protect = false;
  bool loginEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("密码登录", "注册", () {}),
      body: Container(
        child: ListView(
          children: [
            LoginEffect(protect),
            LoginInput(
              "用户名",
              "请输入用户名",
              changed: (text) {
                userName = text;
                checkInput();
              },
            ),
            LoginInput(
              "密码",
              "请输入密码",
              obscureText: true,
              changed: (text) {
                passWord = text;
                checkInput();
              },
              focusChanged: (focus) {
                setState(() {
                  protect = focus;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: LoginButton(
                "登录",
                enable: loginEnable,
                onPressed: _send,
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(passWord)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _send() async {
    try {
      var result = await LoginDao.login(userName, passWord);
    } on Exception catch (e) {
      showWarnToast(e.toString());
    }
  }
}
