import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bibi/db/hi_catch.dart';
import 'package:flutter_bibi/http/a_entity.dart';
import 'package:flutter_bibi/http/core/hi_net.dart';
import 'package:flutter_bibi/http/dao/login_dao.dart';
import 'package:flutter_bibi/http/request/test_request.dart';
import 'package:flutter_bibi/page/login_page.dart';
import 'package:flutter_bibi/page/registration_page.dart';
import 'package:flutter_bibi/widget/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HiCache.preInit();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: RegistrationPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // var result = await LoginDao.registration("345", "345", "123456", "123456");
    // print(result);

    var result = await LoginDao.login("345", "345");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
