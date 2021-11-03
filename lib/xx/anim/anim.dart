import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

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
    _controller = AnimationController(
        // lowerBound: 100, //起始值
        // upperBound: 300, //最大值
        lowerBound: 0, //起始值
        upperBound: 1, //最大值
        duration: Duration(seconds: 3),
        vsync: this);

    _controller.addListener(() {
      print("_controller---anim =====${_controller.value}");
      setState(() {});
    });


    //
    // _tween = ColorTween(begin: Colors.red, end: Colors.yellow);

    _tween = MyColorTween(begin: Colors.red, end: Colors.yellow);

    _colorAnimation = _tween.animate(_controller);

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
        body: Container(
            color: _colorAnimation.value,
            // width: _controller.value,
            // height: _controller.value,
            width: 100,
            height: 200,
            child: Text("anim")),
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
