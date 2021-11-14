import 'package:flutter_splash_screen/flutter_splash_screen.dart';

class AppInit {
  static final String EYE_TAG_ = "eye_====";

  AppInit._();

  ///hide your splash screen
  static Future<String> init() async {
   await Future.delayed(Duration(milliseconds: 3000), () {
      //3秒后隐藏 SplashScreen
      FlutterSplashScreen.hide();
    });
    return "${EYE_TAG_} AppInit()   splash被隐藏了";
  }
}
