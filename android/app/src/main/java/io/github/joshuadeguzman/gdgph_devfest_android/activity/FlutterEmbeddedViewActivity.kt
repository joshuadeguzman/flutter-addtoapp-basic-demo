package io.github.joshuadeguzman.gdgph_devfest_android.activity

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.github.joshuadeguzman.gdgph_devfest_android.R
import io.github.joshuadeguzman.gdgph_devfest_android.fragments.AndroidFragment
import io.github.joshuadeguzman.gdgph_devfest_android.App
import kotlinx.android.synthetic.main.activity_flutter_embedded_view.*
import io.flutter.embedding.android.FlutterView
import android.view.Menu
import android.view.MenuItem

/**
 * Created by Joshua de Guzman on 2019-11-22.
 */
class FlutterEmbeddedViewActivity : AppCompatActivity() {

    companion object {
        fun openActivity(activity: Activity?) {
            val intent = Intent(activity, FlutterEmbeddedViewActivity::class.java)
            activity?.startActivity(intent)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_flutter_embedded_view)

        // Show back button
        val actionBar = supportActionBar
        actionBar?.setDisplayHomeAsUpEnabled(true)

        // Load native Android fragment
        supportFragmentManager
            .beginTransaction()
            .replace(R.id.containerAndroidFragment, AndroidFragment.newInstance())
            .commitAllowingStateLoss()

        // Load Flutter fragment
        val flutterView = FlutterView(this)
        flutterView.attachToFlutterEngine((application as App).engineEmbedded)
        containerFlutterView.addView(flutterView)

        // DISCLAIMER from Flutter Team:
        // You'll need to ensure that pushing a route at the desired time has the desired effect in your app. This approach of pushing routes may not work for all apps.
        // Push route
        (application as App).engineEmbedded
            .navigationChannel
            .pushRoute("/flutter-embedded-view")
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            android.R.id.home -> {
                finish()
                return true
            }
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        return true
    }
}