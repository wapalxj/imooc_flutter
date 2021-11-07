import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imooc_flutter/xx/eyepetizer/app_init.dart';



void main() {
  runApp(MainPage());

  if (Platform.isAndroid) {
    //沉浸式布局
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppInit.init(); //隐藏splash screen
    return FutureBuilder(
        future: AppInit.init(),//异步处理，可以用来加载广告数据等
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          ///snapshot就是future执行过程的状态快照
          ///snapshot.data ===>future执行的结果
          print("${AppInit.EYE_TAG_} ${snapshot.data}");
          return Container(color: Colors.red,);
        });
  }
}
