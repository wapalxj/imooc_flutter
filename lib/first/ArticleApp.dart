import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:imooc_flutter/first/ui/page/page_article.dart';

void main() => runApp(ArticleApp());

class ArticleApp extends StatelessWidget {
  const ArticleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'vero',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorUtil.color("#ff6200"),
        ),
        body: ArticlePage(),
      ),
    );
  }
}
