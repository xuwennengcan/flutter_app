package com.can.flutterapp.router

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import com.can.flutterapp.MainActivity
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

        mTvContent = this.findViewById(R.id.tv_content)

        if (!string.isNullOrEmpty())
            mTvContent?.text = string

        //前往Flutter页面
        this.findViewById<Button>(R.id.btn_go_flutter).setOnClickListener {
            startActivity(Intent(this, MainActivity::class.java))
        }
    }

}