package com.can.flutterapp.utils

import android.annotation.SuppressLint
import android.content.Context
import android.view.Gravity
import android.view.LayoutInflater
import android.widget.TextView
import android.widget.Toast
import com.can.flutterapp.R
import com.can.flutterapp.interfaces.ToastType

/**
 * Created by CAN on 2019/7/26.
 */
class ToastUtils {

    private var mToastUtils: ToastUtils? = null
    private var mToast: Toast? = null

    internal fun getInstance(): ToastUtils {
        if (mToastUtils == null)
            mToastUtils = ToastUtils()
        return mToastUtils!!
    }

    @SuppressLint("InflateParams")
    fun showToast(context: Context?, msg: String?
                  , type: ToastType? = ToastType.NORMAL
                  , gravity: Int? = Gravity.BOTTOM
                  , isLongShow: Boolean = false) {
        if (msg.isNullOrEmpty() || context == null)
            return

        if (mToast != null)
            mToast?.cancel()
        else
            mToast = Toast(context)

        val parentView = LayoutInflater.from(context).inflate(R.layout.layout_toast, null)
        val tv = parentView.findViewById<TextView>(R.id.tv_toast)

        mToast?.let {
            tv.text = msg
            it.view = parentView
            it.setGravity(gravity ?: Gravity.BOTTOM, 0, 35)
            it.duration = if (isLongShow) Toast.LENGTH_LONG else Toast.LENGTH_SHORT
        }

        mToast?.show()
    }

}