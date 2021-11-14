import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imooc_flutter/xx/eyepetizer/app_init.dart';
import 'package:imooc_flutter/xx/eyepetizer/http/http_manager.dart';
import 'package:imooc_flutter/xx/eyepetizer/tabNavigation.dart';

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
        future: AppInit.init(), //异步处理，可以用来加载广告数据等
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          /// snapshot就是future执行过程的状态快照
          /// snapshot.data ===>future执行的结果
          print("${AppInit.EYE_TAG_} ===${snapshot.connectionState} ${snapshot.data}");

          var state = snapshot.connectionState;

          var widget = null;
          if (state == ConnectionState.done) {
            /// future执行完成显示的widget
            widget = TabNavigation();
          } else {
            /// loading
            widget = Scaffold(
                body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ));
          }

          return GetMaterialAppWidget(child: widget);
        });
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget child;

  const GetMaterialAppWidget({Key? key, required this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      initialRoute: "/",
      routes: {
        '/': (context) => widget.child,
      },
    );
  }
}
