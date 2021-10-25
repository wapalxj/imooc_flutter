import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PhotoApp'),
          leading: GestureDetector(
            onTap: () {
              //返回
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(child: Center()));
  }
}
