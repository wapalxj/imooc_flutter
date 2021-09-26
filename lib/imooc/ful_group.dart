import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  print("start run");
  runApp(FulGroup());
}

class FulGroup extends StatefulWidget {
  @override
  _FulGroupState createState() => _FulGroupState();
}

class _FulGroupState extends State<FulGroup> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
        title: 'Flutter FulGroup',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter FulGroup')),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              //选中
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "首页",
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.blue)),
              BottomNavigationBarItem(
                  label: "列表",
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.blue)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('点我'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.network(
                              'https://img1.sycdn.imooc.com/54584f6100019caf02200220-200-200.jpg',
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: '请输入',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('Page1', Colors.blue),
                                  _item('Page2', Colors.red),
                                  _item('Page3', Colors.yellow),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onRefresh: _onRefresh)
              : Text('list'),
        ));
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  //获取一个pageview 的item
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
