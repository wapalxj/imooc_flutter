package com.example.imooc_flutter

import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity

import org.devio.flutter.splashscreen.SplashScreen

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        //显示SplashScreen
//        SplashScreen.show(this, true)
        super.onCreate(savedInstanceState)
    }
}
