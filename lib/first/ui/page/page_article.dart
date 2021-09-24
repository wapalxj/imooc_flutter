import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ///滑动控制器
  ScrollController _controller = ScrollController();

  ///控制正在加载的显示
  bool _isLoading = true;

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
  }

  @override
  Widget build(BuildContext context) {
    return Stack();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
