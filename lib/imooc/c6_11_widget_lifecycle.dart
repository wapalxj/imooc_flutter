import 'package:flutter/material.dart';
import 'package:imooc_flutter/imooc/ful_group.dart';
import 'package:imooc_flutter/imooc/less_group.dart';
import 'package:imooc_flutter/imooc/plugin_user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'c6_9_res.dart';

void main() {
  print("start run");
  runApp(WidgetLifecycle());
}

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({Key? key}) : super(key: key);

  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('生命周期'),
          leading: BackButton(),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Text('点我$_count'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


}
