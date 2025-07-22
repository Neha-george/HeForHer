// android/build.gradle.kts

buildscript {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("com.android.application") version "8.1.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false
    // ✅ ✅ Remove this line if it exists:
    // id("dev.flutter.flutter-gradle-plugin") version "1.0.0" apply false
}
