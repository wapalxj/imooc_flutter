import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page2"),
        leading: GestureDetector(
          onTap: () {
            //返回
            // Navigator.pop(context);

            //返回 结果
            Navigator.pop(context,"page result");
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Text("page2"),
    );
  }
}
