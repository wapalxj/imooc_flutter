import 'package:flutter/material.dart';

//使用资源文件
void main() {
  print("start run");
  runApp(ResPage());
}

class ResPage extends StatefulWidget {
  const ResPage({Key? key}) : super(key: key);

  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ResPage 100,000', style: TextStyle(fontFamily: "Dinot")),
          leading: GestureDetector(
            onTap: () {
              //返回
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 100,
                height: 100,
                image: AssetImage('images/2.0x/img.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
