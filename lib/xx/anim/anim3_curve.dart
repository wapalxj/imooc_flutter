import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(AnimationState());

class AnimationState extends StatefulWidget {
  const AnimationState({Key? key}) : super(key: key);

  @override
  _AnimationStateState createState() => _AnimationStateState();
}

/**
 * 差值器
 */
class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween _tween;
  late Animation _colorAnimation;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0, //起始值
        upperBound: 1, //最大值
        duration: Duration(seconds: 2),
        vsync: this);

    ///差值器,(lowerBound,upperBound)只能使用默认值(0,1)
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);


    //使用自定义的MyColorTween
    _tween = MyColorTween(begin: Colors.red, end: Colors.yellow);


    _colorAnimation = _tween.animate(_curvedAnimation)
      ..addStatusListener((status) {
        //监听执行状态,实现无线循环
        if (status == AnimationStatus.completed) {
          //forward()结束后是completed
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //reverse()结束后是dismissed
          _controller.forward();
        }
      })
      ..addListener(() {
        //获得执行值
        print("_controller---anim =====${_controller.value}");
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("anim"),
        ),
        body: Column(
          children: [
            Container(
                color: _colorAnimation.value,
                // width: _controller.value,
                // height: _controller.value,
                width: 100,
                height: 200,
                child: Text("anim")),
            ElevatedButton(
                onPressed: () {
                  if (_controller.isAnimating) {
                    _controller.stop();
                  } else {
                    _controller.forward();
                  }
                },
                child: Text("点我"))
          ],
        ),
      ),
    );
  }
}

class MyColorTween extends Tween<Color> {
  MyColorTween({Color? begin, Color? end}) : super(begin: begin, end: end);

  @override
  Color lerp(double t) {
    return Color.lerp(begin, end, t)!;
  }
}
