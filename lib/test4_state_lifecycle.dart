import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isShowChild = false;

  //当Widget第一次插入到Widget树时会被调用
  //对于每一个State对象 framework只会调用一次
  @override
  void initState() {
    super.initState();
    isShowChild = true;
    debugPrint("parent======= initState() ");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("parent======= didChangeDependencies() ");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("parent======= build() ");
    //Scaffold,可配置MaterialApp各种风格
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                isShowChild = !isShowChild;
              });
            },
            child: isShowChild ? Child() : null,
          ),
        ),
      ),
    );
  }
}

class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  String data = "hhhhhhhhhhh";

  _ChildState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        //data改变，执行刷新,类似于notify
        //3秒后修改字符串
        this.data = 'veroooooooo';
        debugPrint("log===setStatesetStatesetStatesetState");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("child======= initState() ");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("child======= didChangeDependencies() ");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("child======= build() ");
    return Text(data);
  }

  @override
  void didUpdateWidget(covariant Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("child======= didUpdateWidget() ");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("child======= deactivate() ");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("child======= dispose() ");
  }
}
