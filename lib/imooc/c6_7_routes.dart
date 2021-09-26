import 'package:flutter/material.dart';
import 'package:imooc_flutter/imooc/ful_group.dart';
import 'package:imooc_flutter/imooc/less_group.dart';
import 'package:imooc_flutter/imooc/plugin_user.dart';

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
      home: RouteNavigator(),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroup(),
        'ful': (BuildContext context) => FulGroup(),
        'plugin': (BuildContext context) => PluginUse(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_item('StateRoute', LessGroup(), 'less')],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ,
    );

  }
}