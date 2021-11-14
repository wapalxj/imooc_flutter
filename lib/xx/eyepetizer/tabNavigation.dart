import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imooc_flutter/xx/eyepetizer/config/string.dart';
import 'package:imooc_flutter/xx/eyepetizer/utils/toast_util.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  DateTime? lastTime;

  Widget _currentBody = Container(
    color: Colors.blue,
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    /// 点击2次退出  提醒
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _currentBody,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,///文字固定
          ///文字颜色
          selectedItemColor: Color(0xff000000),
          unselectedItemColor: Color(0xff9a9a9a),
          items: _items(),
          onTap: _onTap,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return [
      _bottomItem(StringUtils.home, 'images/ic_home_normal.png',
          'images/ic_home_selected.png'),
      _bottomItem(StringUtils.discovery, 'images/ic_discovery_normal.png',
          'images/ic_discovery_selected.png'),
      _bottomItem(StringUtils.hot, 'images/ic_hot_normal.png',
          'images/ic_hot_selected.png'),
      _bottomItem(StringUtils.mine, 'images/ic_mine_normal.png',
          'images/ic_mine_selected.png'),
    ];
  }

  BottomNavigationBarItem _bottomItem(
      String title, String normalIcon, String selectedIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(normalIcon, width: 24, height: 24),
      activeIcon: Image.asset(selectedIcon, width: 24, height: 24),
      label: title,
    );
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _currentBody = Container(
          color: Colors.blue,
        );
        break;
      case 1:
        _currentBody = Container(
          color: Colors.brown,
        );
        break;
      case 2:
        _currentBody = Container(
          color: Colors.amber,
        );
        break;
      case 3:
        _currentBody = Container(
          color: Colors.red,
        );
        break;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime!) > Duration(seconds: 2)) {
      lastTime = DateTime.now();

      /// 再点1次退出
      ToastUtils.showTip(StringUtils.exit_tip);
      return false;
    } else {
      /// 退出
      return true;
    }
  }
}
