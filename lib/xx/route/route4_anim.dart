import 'package:flutter/material.dart';
import 'package:imooc_flutter/xx/route/page2.dart';

void main() => runApp(MainPage4());

class MainPage4 extends StatelessWidget {
  const MainPage4({Key? key}) : super(key: key);

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
            //获取
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                     Animation<double> animation,
                    Animation<double> secondaryAnimation) {

              // return Page2();///无动画

              return _getAnimation(animation);
            }));
          },
          child: Text("去第二个页面")),
    );
  }

  _getAnimation(Animation<double> animation) {
    //平移动画
    // return SlideTransition(
    //     position: Tween<Offset>(
    //         begin: Offset(1.0, 0.0),
    //         end: Offset(0.0, 0.0))
    //         .animate(animation),
    //     child: Page2());

    //渐变+平移
    return FadeTransition(
        opacity: animation,
        child: SlideTransition(
            position:
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
            child: Page2()));
  }
}
