package io.github.joshuadeguzman.gdgph_devfest_android

import android.app.Activity
import android.content.Intent

/**
 * Created by Joshua de Guzman on 2019-11-22.
 */
class FlutterEmbeddedViewActivity : Activity() {

    companion object {
        fun openActivity(activity: Activity?) {
            val intent = Intent(activity, FlutterEmbeddedViewActivity::class.java)
            activity?.startActivity(intent)
        }
    }
}