package io.github.joshuadeguzman.gdgph_devfest_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.*
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    lateinit var usernameChannel: BasicMessageChannel<String>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Subscribe to username channel
        val usernameChannel = MethodChannel((application as App).engine.dartExecutor, "channel-username")
        usernameChannel.setMethodCallHandler { call, result ->
            when (call.method.toString()) {
                "close-activity" -> finishActivity(101)
                else -> result.notImplemented()
            }
        }
        // Subscribe to button clicks
        btLoadFlutterScreen.setOnClickListener {
            // Send username to Dart
            usernameChannel.invokeMethod("send-username", "Joshua")

            // Option 1. Recommended.
            // This is an example regarding how we can cache Flutter engine on application start
            val intent = FlutterActivity
                .withCachedEngine(App.CACHE_ENGINE_NAME)
                .build(applicationContext)
            startActivityForResult(intent, 101)

            // Option 2. Preferred when only showing the screen for a short period of time.
            // This is the basic implementation on using Flutter Activity
            // startActivity(FlutterActivity.createDefaultIntent(applicationContext))
        }

        // Subscribe to button clicks
        btLoadEmbeddedFlutterView.setOnClickListener {
            FlutterEmbeddedViewActivity.openActivity(this)
        }
    }
}
