import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:imooc_flutter/xx/route/page2.dart';

void main() => runApp(MainPage3());

class MainPage3 extends StatelessWidget {
  const MainPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第一个页面 按名称",
      // home: MainPageDetail(),
      routes: <String, WidgetBuilder>{

        "page2": (BuildContext context) => Page2(),

        //home:
        "/": (BuildContext context) => MainPageDetail()

      },
    );
  }
}

class MainPageDetail extends StatelessWidget {
  const MainPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("route_main 按名称"),
        leading: GestureDetector(
          onTap: () {
            //返回
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "page2");
          },
          child: Text("去第二个页面")),
    );
  }
}
