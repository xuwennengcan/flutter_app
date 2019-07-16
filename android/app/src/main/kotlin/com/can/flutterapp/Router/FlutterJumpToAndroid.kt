package com.can.flutterapp.Router

import android.app.Activity
import android.content.Intent
import android.os.Build
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Created by CAN on 2019/7/16.
 * Flutter跳转至Android原生
 */
class FlutterJumpToAndroid(private val mActivity: Activity) : MethodChannel.MethodCallHandler {

    companion object {
        const val TEST = "test"
    }

    var mChannel: MethodChannel? = null

    //注册插件
    fun register(registrar: PluginRegistry.Registrar) {
        mChannel = MethodChannel(registrar.messenger(), TEST)
        //添加通道回调
        mChannel?.setMethodCallHandler(FlutterJumpToAndroid(registrar.activity()))
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        Log.i("FlutterJumpToAndroid", " call = ${call.method} , arguments = ${call.arguments}")

        if (call.method == "test") {
            val intent = Intent(mActivity, TestParameterTransmitActivity::class.java)
            val fromFlutter = call.arguments as? String
            if (!fromFlutter.isNullOrEmpty())
                intent.putExtra("test", fromFlutter)
            mActivity.startActivity(intent)

            result.success("success")
        } else {
            result.notImplemented()
        }
    }

}