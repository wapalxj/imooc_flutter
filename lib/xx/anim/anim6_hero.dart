import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(AnimationState());

class AnimationState extends StatefulWidget {
  const AnimationState({Key? key}) : super(key: key);

  @override
  _AnimationStateState createState() => _AnimationStateState();
}

///内置动画
class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: key,
      home: Scaffold(
          appBar: AppBar(
            title: Text("anim hero"),
          ),
          body: Row(
            children: <Widget>[
              Expanded(
                child: Text("anim hero"),
              ),
              InkWell(
                child: Container(
                  width: 120.0,
                  child: Hero(
                    tag: "image",
                    child: Image.network(
                        "http://photogz.photo.store.qq.com/psc?/720410ab-1b8f-4148-9f17-3aa823f1ea9e/TmEUgtj9EK6.7V8ajmQrEPjyZ*P7Fi3BLAZ5KEPTXZVjbhprHANsT0Xh8wj8g.gQTo..bU0RvXriTaU2teSvaVqx4a39EPfl5Gw.6V90h84!/b&bo=1QLHA9UCxwMBFzA!&rf=viewer_4"),
                  ),
                ),
                onTap: () {
                  key.currentState?.push(MaterialPageRoute(builder: (BuildContext context) {
                    return NewPage();
                  }));
                },
              ),
            ],
          )),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("new page"),
      ),
      body: Hero(
        tag: "image",
        child: Image.network(
            "http://photogz.photo.store.qq.com/psc?/720410ab-1b8f-4148-9f17-3aa823f1ea9e/TmEUgtj9EK6.7V8ajmQrEPjyZ*P7Fi3BLAZ5KEPTXZVjbhprHANsT0Xh8wj8g.gQTo..bU0RvXriTaU2teSvaVqx4a39EPfl5Gw.6V90h84!/b&bo=1QLHA9UCxwMBFzA!&rf=viewer_4"),
      ),
    ));
  }
}
