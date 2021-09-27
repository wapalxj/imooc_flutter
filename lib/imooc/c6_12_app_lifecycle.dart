import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//应用生命周期
void main() {
  print("start run");
  runApp(AppLifecycle());
}

class AppLifecycle extends StatefulWidget {
  const AppLifecycle({Key? key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

//WidgetsBindingObserver
class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("AppLifecycleState===paused 进入后台");
    } else if (state == AppLifecycleState.resumed) {
      print("AppLifecycleState===resumed 进入前台");
    } else if (state == AppLifecycleState.inactive) {
      //非活动状态，并且未接收用户输入
      print("AppLifecycleState===inactive ");
      //表示flutter引擎脱离了宿主view
    } else if (state == AppLifecycleState.detached) {
      print("AppLifecycleState===detached  表示flutter引擎脱离了宿主view");
    }else{
      print("AppLifecycleState===$state");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('app生命周期'),
          leading: BackButton(
            onPressed: () {
              //返回
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text('app生命周期'),
        ),
      ),
    );
  }
}
