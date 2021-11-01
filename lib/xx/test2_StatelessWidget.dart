import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // //居中容器
    // return Center(
    //   child: Text(
    //     "followme",
    //     textDirection: TextDirection.ltr,//方向：从左到右
    //   ),
    // );

    // //MaterialApp,Text带有默认值
    // return MaterialApp(
    //   home: Center(
    //     child: Text('followme'),
    //   ),
    // );

    //Scaffold,可配置MaterialApp各种风格
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hhhhhhhh')),
        body: Center(
          child: Text('followme'),
        ),
      ),
    );
  }
}
