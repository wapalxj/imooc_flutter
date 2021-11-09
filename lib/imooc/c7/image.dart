import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  print("start run");
  runApp(ImagePage());
}

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("image"),
        ),
        body: Column(
          children: [
            Container(
              child: Image.network("https://www.devio.org/img/avatar.png"),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.asset("images/img.jpg"),
            ),
            Container(
              width: 200,
              height: 200,
              //绝对路径 内部  data/data/packageName/files
              child: Image.file(File("/data/data/com.example.imooc_flutter/files/me.jpg")),
            ),
          ],
        ),
      ),
    );

    // return FutureBuilder(future:_getLocalImage("me.jpg"),builder:(BuildContext context, AsyncSnapshot<File> snapshot){
    //   return snapshot.data!=null ? Image.file(snapshot.data!) :Container();
    // });
  }

  // _getLocalImage(String name) {
  //   String dir= getInt()
  // }
}
