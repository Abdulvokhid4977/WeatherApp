package com.example.weather_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("129df637-72e2-4d7b-82a6-54dd1be08fae") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
