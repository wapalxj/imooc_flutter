import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  String data = "hhhhhhhhhhh";

  MyApp() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      //3秒后修改字符串
      //StatelessWidget失败
      this.data = 'veroooooooo';
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold,可配置MaterialApp各种风格
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hhhhhhhh')),
        body: Center(
          child: Text(data),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  MyApp2();

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String data = "hhhhhhhhhhh";

  _MyApp2State() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      //3秒后修改字符串
      this.data = 'veroooooooo';
      setState(() {
        //data改变，执行刷新,类似于notify
        debugPrint("log===setStatesetStatesetStatesetState");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("log===buildbuildbuildbuild");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hhhhhhhh')),
        body: Center(child: Text(data)),
      ),
    );
  }
}
