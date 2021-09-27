import 'package:flutter/material.dart';
import 'package:imooc_flutter/imooc/ful_group.dart';
import 'package:imooc_flutter/imooc/less_group.dart';
import 'package:imooc_flutter/imooc/plugin_user.dart';

import 'c6_12_app_lifecycle.dart';
import 'c6_13_theme.dart';
import 'c6_9_res.dart';

void main() {
  print("start run");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroup(),
        'ful': (BuildContext context) => FulGroup(),
        'plugin': (BuildContext context) => PluginUse(),
        'res': (BuildContext context) => ResPage(),
        'app_life': (BuildContext context) => AppLifecycle(),
        'theme': (BuildContext context) => DynamicTheme(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由名字跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('LessGroup', LessGroup(), 'less'),
          _item('FulGroup', FulGroup(), 'ful'),
          _item('PluginUse', PluginUse(), 'plugin'),
          _item('ResPage', ResPage(), 'res'),
          _item('AppLifecycle', AppLifecycle(), 'app_life'),
          _item('theme_page', DynamicTheme(), 'theme'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          //按钮点击
          //2种跳转方式
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
