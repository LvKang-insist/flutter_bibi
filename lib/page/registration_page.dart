/// @name：registration_page
/// @package：page
/// @author：345 QQ:1831712732
/// @time：2021/05/07 17:47
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

class RegistrationPage extends StatefulWidget {
  final VoidCallback onJumpToLogin;

  const RegistrationPage({Key key, this.onJumpToLogin}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;
  bool loginEnable = false;
  String userName;
  String passWord;
  String rePassWord;
  String imoocId;
  String orderId;

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
                userName = value;
                checkInput();
              },
            ),
            LoginInput(
              "密码",
              "请输入密码",
              obscureText: true,
              lineStretch: true,
              changed: (value) {
                passWord = value;
                checkInput();
              },
              focusChanged: (focus) => setState(() => protect = focus),
            ),
            LoginInput(
              "确认密码",
              "在再次输入密码",
              obscureText: true,
              lineStretch: true,
              changed: (value) {
                rePassWord = value;
                checkInput();
              },
              focusChanged: (focus) => setState(() => protect = focus),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: _loginButton(),
            )
          ],
        ),
      ),
    );
  }

  void checkInput() {
    bool enable;
    if (isNotEmpty(userName) &&
        isNotEmpty(passWord) &&
        isNotEmpty(rePassWord)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _loginButton() {
    return LoginButton(
      "注册",
      enable: loginEnable,
      onPressed: () {
        checkParams();
      },
    );
  }

  void _send() async {
    try {
      var result =
          await LoginDao.registration(userName, passWord, "123456", "123456");
    } on Exception catch (e) {
      showWarnToast(e.toString());
    }

    if (widget.onJumpToLogin != null) {
      widget.onJumpToLogin();
    }
  }

  void checkParams() {
    String tips;
    if (passWord != rePassWord) tips = "兩次密碼不一致";
    if (tips != null) {
      print(tips);
      return;
    }
    _send();
  }
}
