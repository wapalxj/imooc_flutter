import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(AnimationState());

class AnimationState extends StatefulWidget {
  const AnimationState({Key? key}) : super(key: key);

  @override
  _AnimationStateState createState() => _AnimationStateState();
}

///内置动画
class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0.3, //起始值
        upperBound: 1, //最大值
        duration: Duration(seconds: 2),
        vsync: this)
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
    ;

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
            ScaleTransition(
              scale: _controller,
              child: Container(
                color: Colors.red,
                width: 100,
                height: 200,
                child: Text("ScaleTransition"),
              ),
            ),
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
