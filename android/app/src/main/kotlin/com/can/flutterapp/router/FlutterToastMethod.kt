package com.can.flutterapp.router

import android.app.Activity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Created by CAN on 2019/7/26.
 * Flutter调用Android原生Toast方法插件
 */
class FlutterToastMethod(private val mActivity: Activity) : MethodChannel.MethodCallHandler {

    //注册插件
    fun register(registrar: PluginRegistry.Registrar) {
        val channel = MethodChannel(registrar.messenger(), FlutterToastMethod::class.java.name)
        channel.setMethodCallHandler(FlutterToastMethod(registrar.activity()))
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.isNullOrEmpty())
            return
        if (call.method == FlutterToastMethod::class.java.name) {


        }

    }


}