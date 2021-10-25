import 'package:flutter/material.dart';

void main() {
  print("start run");
  runApp(GesturePage());
}

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  var printString = '';
  var moveX = 0.0;
  var moveY = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('点击事件'),
          leading: GestureDetector(
            onTap: () {
              //返回
              Navigator.pop(context);
            },
          ),
        ),
        body: FractionallySizedBox(
          //宽度撑满屏幕
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => _printMsg('点击'),
                      onDoubleTap: () => _printMsg('双击'),
                      onLongPress: () => _printMsg('长按'),
                      onTapCancel: () => _printMsg('取消'),
                      onTapUp: (e) => _printMsg('松开'),
                      onTapDown: (e) => _printMsg('按下'),
                      child: Container(
                        //点击的view
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.red),
                        child: Text(
                          '点我',
                          style: TextStyle(fontSize: 36, color: Colors.blue),
                        ),
                      )),
                  Text(printString)
                ],
              ),
              Positioned(
                  //小球跟随手指移动
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(//画一个球，矩形72，半径36
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(36)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _printMsg(String msg) {
    setState(() {
      printString += ',$msg';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
