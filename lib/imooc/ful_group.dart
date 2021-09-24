import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  print("start run");
  runApp(FulGroup());
}

class FulGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
        title: 'Flutter LessGroup',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter LessGroup')),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text("vero0000", style: textStyle),
                Text("vero1111", style: textStyle),
                Text("vero2222", style: textStyle),
                Text("vero3333", style: textStyle),
                Icon(Icons.android, size: 50, color: Colors.red),
                CloseButton(),
                BackButton(),
                Chip(avatar: Icon(Icons.people), label: Text('chip')),
                Divider(
                    height: 10, //容器高度，不是是线的高度
                    indent: 100, //左侧间距
                    color: Colors.orange),
                Card(
                  color: Colors.blue,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("card", style: textStyle)),
                ),
                AlertDialog(
                  title: Text('dialog'),
                  content: Text('dialog'),
                ),
              ],
            ),
          ),
        ));
  }
}
