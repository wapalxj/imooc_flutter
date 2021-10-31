import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:imooc_flutter/xx/route/page2.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: Text("route_main"),
                leading: GestureDetector(
                  onTap: () {
                    //返回
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
              body: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return Page2();
                    }));
                  },
                  child: Text("去第二个页面")),
            );
        }
      )
      );
  }
}

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("route_main"),
//           leading: GestureDetector(
//             onTap: () {
//               //返回
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back),
//           ),
//         ),
//         body: ElevatedButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (c) {
//                 return Page2();
//               }));
//             },
//             child: Text("去第二个页面")),
//       ),
//     );
//   }
// }
