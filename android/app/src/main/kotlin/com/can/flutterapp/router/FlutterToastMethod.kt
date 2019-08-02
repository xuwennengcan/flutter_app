package com.can.flutterapp.router

import android.app.Activity
import android.view.Gravity
import android.widget.Toast
import com.can.flutterapp.interfaces.ToastType
import com.can.flutterapp.utils.ToastUtils
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Created by CAN on 2019/7/26.
 * Flutter调用Android原生Toast方法插件
 */
class FlutterToastMethod(private val mActivity: Activity) : MethodChannel.MethodCallHandler {

    companion object {
        const val TOAST = "toast"
    }

    //注册插件
    fun register(registrar: PluginRegistry.Registrar) {
        val channel = MethodChannel(registrar.messenger(), TOAST)
        channel.setMethodCallHandler(FlutterToastMethod(registrar.activity()))
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.isNullOrEmpty())
            return
        if (call.method == TOAST) {
            val msg = call.argument<String>("msg")
            val gravity = call.argument<String>("gravity")
            val isLongShow = call.argument<Boolean>("long") ?: false

            val toastType = when (call.argument<Int>("type")) {
                0 -> ToastType.NORMAL

                else -> ToastType.NORMAL
            }

            val toastGravity = when (gravity) {
                "top" -> Gravity.TOP
                "bottom" -> Gravity.BOTTOM
                "center" -> Gravity.CENTER
                else -> Gravity.BOTTOM
            }

            ToastUtils().getInstance().showToast(mActivity, msg, toastType, toastGravity, isLongShow)

        }

    }


}