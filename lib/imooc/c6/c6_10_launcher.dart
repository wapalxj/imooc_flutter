import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'c6_9_res.dart';

void main() {
  print("start run");
  runApp(Launcher());
}

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ResPage'),
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
            children: <Widget>[
              Container(
                width: 100,
                height: 60,
                child: ElevatedButton(
                  child: Text('打开baidu'),
                  onPressed: () {
                    //打开网页
                    _launchInBrowser('http://www.baidu.com');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 100,
                height: 60,
                child: ElevatedButton(
                  child: Text('打电话'),
                  onPressed: () {
                    //打电话
                    _makePhoneCall('tel:18468050252');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
