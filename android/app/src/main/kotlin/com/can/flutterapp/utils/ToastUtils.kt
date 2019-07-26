package com.can.flutterapp.utils

import android.annotation.SuppressLint
import android.content.Context
import android.view.Gravity
import android.view.LayoutInflater
import android.widget.Toast
import com.can.flutterapp.R
import com.can.flutterapp.interfaces.ToastType

/**
 * Created by CAN on 2019/7/26.
 */
class ToastUtils {

    private var mToastUtils: ToastUtils? = null
    private var mContext: Context? = null
    private var mToast: Toast? = null

    fun getInstance(context: Context): ToastUtils {
        if (mToastUtils == null)
            mToastUtils = ToastUtils()
        if (mContext == null)
            mContext = context
        return mToastUtils!!
    }

    @SuppressLint("InflateParams")
    fun showToast(msg: String?
                  , type: ToastType? = ToastType.NORMAL
                  , gravity: Int? = Gravity.CENTER) {
        if (msg.isNullOrEmpty() || mContext == null)
            return

        if (mToast != null)
            mToast?.cancel()

        val parentView = LayoutInflater.from(mContext).inflate(R.layout.layout_toast, null)


    }

}