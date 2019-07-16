package com.can.flutterapp.Router

import android.app.Activity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Created by CAN on 2019/7/16.
 * Flutter计数器
 */
class FlutterPluginCounter(private val mActivity: Activity) : EventChannel.StreamHandler {


    companion object {
        const val TEST = "test"
    }

    //注册插件
    fun register(registrar: PluginRegistry.Registrar) {
        val channel = EventChannel(registrar.messenger(), TEST)
        channel.setStreamHandler(FlutterPluginCounter(registrar.activity()))
    }

    override fun onListen(a: Any?, sink: EventChannel.EventSink?) {
        sink?.success("success")
    }

    override fun onCancel(a: Any?) {
    }
}