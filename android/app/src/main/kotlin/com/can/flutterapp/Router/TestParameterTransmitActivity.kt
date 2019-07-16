package com.can.flutterapp.Router

import android.app.Activity
import android.os.Bundle
import android.widget.TextView
import com.can.flutterapp.R

/**
 * Created by CAN on 2019/7/16.
 * 测试Flutter传递参数至原生Activity
 */
class TestParameterTransmitActivity : Activity() {

    private var mTvContent: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)

        val string = intent?.getStringExtra("test")

        mTvContent = findViewById(R.id.tv_content)

        if(!string.isNullOrEmpty())
            mTvContent?.text = string

    }

}