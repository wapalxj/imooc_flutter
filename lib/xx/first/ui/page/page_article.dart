import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:imooc_flutter/xx/first/http/api.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ///滑动控制器
  ScrollController _controller = ScrollController();

  ///控制正在加载的显示
  bool _isHide = true;

  ///请求到的文章数据
  List articles = [];

  List banners = [];

  ///总数
  var listTotalSize = 0;

  ///当前页index
  var curPage = 0;

  @override
  void initState() {
    super.initState();

    //上拉加载
    _controller.addListener(() {
      ///获取ScrollController 监听控件可以滚动的最大距离
      var maxScroll = _controller.position.maxScrollExtent;

      ///获得当前位置的像素值
      var pixels = _controller.position.pixels;

      ///当前滑动位置到达底部，加载更多
      if (maxScroll == pixels && articles.length < listTotalSize) {

        print("_getArticleList== listTotalSize== ${listTotalSize}");

        _getArticleList();
      }
    });

    //初始请求数据
    _pullToRefresh();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pullToRefresh() async {
    curPage = 0;
    //组合2个请求
    Iterable<Future> futures = [_getArticleList(), _getBanner()];
    await Future.wait(futures);
    _isHide = false;

    //重新执行build()
    setState(() {});
  }

  //请求列表
  _getArticleList([bool update = true]) async {
    //请求成功是map,失败是null
    var data = await Api.getArticleList(0);

    print("_getArticleList====0000000000000 ${data}");
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      //文章总数
      listTotalSize = map['total'];

      print("_getArticleList== listTotalSize== ${listTotalSize}");

      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);

      print("_getArticleList==== ${articles.length}");

      //更新ui
      if (update) {
        //重新执行build()
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Offstage控件： 控制显示/隐的

        ///正在加载
        Offstage(
          offstage: !_isHide, //显示loading
          child: Center(child: CircularProgressIndicator()),
        ),

        ///内容
        // Offstage(
        //   offstage: _isHide, //显示内容
        //   child: Center(child: Text("加载完成")),
        // )
        //

        ///内容
        Offstage(
          offstage: _isHide, //显示内容
          //下拉刷新
          child: RefreshIndicator(
              //Listview
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, i) => _buildItem(i),
                controller: _controller,
              ),
              onRefresh: _pullToRefresh),
        )
      ],
    );
  }

  Widget _buildItem(int position) {
    // return Text("item ==== $i in ${articles.length}");

    // if (position == 0) {
    //   //banner
    //   return Container(height: 180, child: _bannerView());
    // }

    var color;
    if (position % 2 == 0) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    return Container(
        color: color,
        height: 100,
        child: Text("item ==== $position in ${articles.length}"));
  }

// Widget _bannerView() {
//   var list = banners.map((item) {
//     print("_bannerView====${item['imagePath']}");
//     return Image.network(item['imagePath'], fit: BoxFit.cover);
//   }).toList();
//
//   if (list.isEmpty) {
//     print("_bannerView====list.isEmpty");
//     return null;
//   }
//   return BannerView(
//     list,
//     intervalDuration: const Duration(seconds: 3),
//   );
// }
}
