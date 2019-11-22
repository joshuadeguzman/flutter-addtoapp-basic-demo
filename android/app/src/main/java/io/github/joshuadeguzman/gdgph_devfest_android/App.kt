package io.github.joshuadeguzman.gdgph_devfest_android

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

/**
 * Created by Joshua de Guzman on 2019-11-22.
 */
class App : Application() {
    lateinit var engine: FlutterEngine

    companion object {
        const val CACHE_ENGINE_NAME = "gdgph_android"
    }

    override fun onCreate() {
        super.onCreate()

        // Instantiate Flutter engine
        engine = FlutterEngine(applicationContext)

        // Pre-warm Flutter engine
        engine
            .dartExecutor
            .executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )

        // Prepare engine id for the Flutter Engine Cache
        FlutterEngineCache
            .getInstance()
            .put(CACHE_ENGINE_NAME, engine)
    }
}