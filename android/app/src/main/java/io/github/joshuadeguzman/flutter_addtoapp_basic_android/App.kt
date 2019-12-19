package io.github.joshuadeguzman.flutter_addtoapp_basic_android

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

/**
 * Created by Joshua de Guzman on 2019-11-22.
 */
class App : Application() {
    lateinit var engine: FlutterEngine
    lateinit var engineEmbedded: FlutterEngine

    companion object {
        const val CACHE_ENGINE_NAME = "flutter_addtoapp_basic"
        const val CACHE_ENGINE_EMBEDDED_NAME = "flutter_addtoapp_basic_embedded"
    }

    override fun onCreate() {
        super.onCreate()

        this.preWarmUpFullScreenFlutter()
        this.preWarmUpEmbeddedFlutter()
    }

    private fun preWarmUpFullScreenFlutter() {
        // Full Screen
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

    private fun preWarmUpEmbeddedFlutter() {
        // Embedded
        engineEmbedded = FlutterEngine(applicationContext)

        // Pre-warm Flutter engine
        engineEmbedded
            .dartExecutor
            .executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )

        // Prepare engine id for the Flutter Engine Cache
        FlutterEngineCache
            .getInstance()
            .put(CACHE_ENGINE_EMBEDDED_NAME, engineEmbedded)
    }
}