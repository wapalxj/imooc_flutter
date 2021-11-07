import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(AnimationState());

class AnimationState extends StatefulWidget {
  const AnimationState({Key? key}) : super(key: key);

  @override
  _AnimationStateState createState() => _AnimationStateState();
}

class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween _tween;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _tween = ColorTween(begin: Colors.red, end: Colors.yellow);

    _controller = AnimationController(
        lowerBound: 0, //起始值
        upperBound: 1, //最大值
        duration: Duration(seconds: 2),
        vsync: this);

    _colorAnimation = _tween.animate(_controller)
      ..addStatusListener((status) {
        //监听执行状态,实现无线循环
        if (status == AnimationStatus.completed) {
          //forward()结束后是completed
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //reverse()结束后是dismissed
          _controller.forward();
        }
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
            // MyAnimationWidget(
            //   child: Container(width: 100, height: 200, child: Text("MyAnimationWidget")),
            //   animation: _colorAnimation as Animation<Color?>,
            // ),
            AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Container(
                      color: _colorAnimation.value,
                      // width: _controller.value,
                      // height: _controller.value,
                      width: 100,
                      height: 200,
                      child: Text("AnimatedBuilder"));
                }),
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

///自定义AnimatedWidget

class MyAnimationWidget extends AnimatedWidget {
  final Widget? child;

  MyAnimationWidget({this.child, required Animation<Color?> animation})
      : super(listenable: animation) {}

  Animation<Color?> get color => listenable as Animation<Color?>;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      color: color.value,
    );
  }
}
