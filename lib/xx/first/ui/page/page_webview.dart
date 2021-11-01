import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoad = true;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  late StreamSubscription<WebViewStateChanged>  _onStateChanged;

  @override
  void dispose() {
    super.dispose();
    _onStateChanged.cancel();
    flutterWebViewPlugin.dispose();
  }
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    //这个回调不会触发，不知道是什么问题
    _onStateChanged =flutterWebViewPlugin.onStateChanged.listen((state) {
      print("WebViewState00000====$state");
      //监听webview的加载
      if (state.type == WebViewState.finishLoad) {
        //加载完成
        setState(() {
          print("WebViewState====finishLoad");
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          print("WebViewState====startLoad");
          isLoad = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("webview"),
        //进度条
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: const LinearProgressIndicator(),
        ),
        bottomOpacity: isLoad ? 1.0 : 0.0,
      ),
      url: "https://flutter.io",
      withJavascript: true,
      withLocalStorage: true,
    );
  }
}
