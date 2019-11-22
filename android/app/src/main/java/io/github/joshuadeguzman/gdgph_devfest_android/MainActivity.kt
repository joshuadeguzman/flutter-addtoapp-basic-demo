package io.github.joshuadeguzman.gdgph_devfest_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btLoadFlutterScreen.setOnClickListener {
            startActivity(FlutterActivity.createDefaultIntent(applicationContext))
        }

        btLoadEmbeddedFlutterView.setOnClickListener {
            FlutterEmbeddedViewActivity.openActivity(this)
        }
    }
}
