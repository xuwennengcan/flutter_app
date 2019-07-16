package com.can.flutterapp

import android.os.Bundle
import com.can.flutterapp.Router.FlutterJumpToAndroid

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        //注册Flutter与原生交互插件
        FlutterJumpToAndroid(this).register(registrarFor(FlutterJumpToAndroid.TEST))
    }
}
