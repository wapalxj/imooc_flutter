import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  print("start run");
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key? key}) : super(key: key);

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theme',
      theme: ThemeData(
        // brightness: Brightness.dark,
        fontFamily: "Dinot",
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter FulGroup 120,000'),
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
              child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (_brightness == Brightness.dark) {
                  _brightness = Brightness.light;
                } else {
                  _brightness = Brightness.dark;
                }
              });
            },
            child: Text('点我'),
          )),
        ),
      ),
    );
  }
}
