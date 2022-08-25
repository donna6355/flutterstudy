package com.example.bloc_try

import io.flutter.embedding.android.FlutterActivity
import android.view.WindowManager.LayoutParams

class MainActivity: FlutterActivity() {   
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        window.addFlags(LayoutParams.FLAG_SECURE)
        super.configureFlutterEngine(flutterEngine)
    }
}
