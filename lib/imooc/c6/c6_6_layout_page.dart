import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  print("start run");
  runApp(_FulState());
}

class _FulState extends StatefulWidget {
  @override
  _FulStateState createState() => _FulStateState();
}

class _FulStateState extends State<_FulState> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
        title: 'Flutter Layout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter Layout')),
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
                  label: "home",
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.blue)),
              BottomNavigationBarItem(
                  label: "list",
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
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Row(
                              //行
                              children: [
                                ClipOval(
                                  //圆形裁剪
                                  child: SizedBox(
                                    //约束大小
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                        'https://img1.sycdn.imooc.com/54584f6100019caf02200220-200-200.jpg'),
                                  ),
                                ),
                                Padding(
                                  //内边距
                                  padding: EdgeInsets.all(20),
                                  child: ClipRRect(
                                    //方形裁剪
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)), //圆角
                                    child: Opacity(
                                        //60%透明度
                                        opacity: 0.6,
                                        child: Image.network(
                                          'https://img1.sycdn.imooc.com/54584f6100019caf02200220-200-200.jpg',
                                          width: 100,
                                          height: 100,
                                        )),
                                  ),
                                )
                              ],
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
                              margin: EdgeInsets.all(10),
                              child: PhysicalModel(
                                //裁剪PageView为圆角
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                clipBehavior: Clip.antiAlias,
                                child: PageView(children: <Widget>[
                                  _item('Page1', Colors.blue),
                                  _item('Page2', Colors.red),
                                  _item('Page3', Colors.yellow),
                                ]),
                              ),
                            ),
                            Container(child: FractionallySizedBox(
                              widthFactor: 1, //宽度撑满
                              child: Container(
                                decoration: BoxDecoration(color: Colors.green),
                                child: Text('宽度撑满'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Stack(
                        //FrameLayout
                        children: [
                          Image.network(
                            'https://img1.sycdn.imooc.com/54584f6100019caf02200220-200-200.jpg',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                            //指定位置,左下方
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              'https://img1.sycdn.imooc.com/54584f6100019caf02200220-200-200.jpg',
                              width: 36,
                              height: 36,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Wrap(
                          //wrap:从左到右进行排列，会自动换行
                          spacing: 8, //水平间距
                          runSpacing: 16, //垂直间距
                          children: <Widget>[
                            _chip('flutter'),
                            _chip('vero'),
                            _chip('vnis111111111111111111'),
                            _chip('appp'),
                            _chip('vvvvv'),
                          ],
                        ),
                      )
                    ],
                  ),
                  onRefresh: _onRefresh)
              : Column(
                  children: <Widget>[
                    Text('列表'),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('拉伸填满高度'),
                    )),
                    Text('列表底部'),
                  ],
                ),
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

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text(
              label.substring(0, 1),
              style: TextStyle(fontSize: 10),
            )));
  }
}
