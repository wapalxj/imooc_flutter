import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  print("start run");
  runApp(PhotoApp());
}

class PhotoApp extends StatefulWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theme',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Dinot",
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
        body: Container(
          child: Center(
            child: Text("sadasd"),
          ),
        ),
      ),
    );
  }
}
