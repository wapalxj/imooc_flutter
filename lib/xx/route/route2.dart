import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:imooc_flutter/xx/route/page2.dart';

void main() => runApp(MainPage2());

class MainPage2 extends StatelessWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第一个页面",
      home: MainPageDetail(),
    );
  }
}

class MainPageDetail extends StatelessWidget {
  const MainPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("route_main"),
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
            // Navigator.push(context, MaterialPageRoute(builder: (c) {
            //   return Page2();
            // }));

            //获取
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return Page2();
            })).then((value) {
              print("===获取到的返回值==$value");
            });
          },

          child: Text("去第二个页面")),
    );
  }
}
