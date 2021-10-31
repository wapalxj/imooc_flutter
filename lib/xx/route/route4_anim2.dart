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

class MainPageDetail extends StatefulWidget {
  const MainPageDetail({Key? key}) : super(key: key);

  @override
  _MainPageDetailState createState() => _MainPageDetailState();
}

class _MainPageDetailState extends State<MainPageDetail> with SingleTickerProviderStateMixin {

  //动画控制器
  late AnimationController _controller;

  //移除的动画
  late Animation<Offset> _animate;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    //动画控制器
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    //移除的动画
    _animate = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0))
        .animate(_controller);
  }

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
      body: SlideTransition(
        position: _animate,
        child: ElevatedButton(
            onPressed: () {
              //旧页面移除动画
              _controller.forward();

              //获取
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                // return Page2();///无动画

                return _getAnimation(animation);
              })).then((value)  {

              //旧页面恢复
              _controller.reverse();

              });
            },
            child: Text("去第二个页面")),
      ),
    );
  }
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
