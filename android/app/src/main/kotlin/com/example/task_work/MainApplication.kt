package com.example.task_work

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("7eef123a-9e03-4801-a172-5719d8fa4eb5") // Your generated API key
    }
}