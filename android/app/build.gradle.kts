// android/app/build.gradle.kts
import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

android {
    namespace = "com.example.chatiar_app"
    compileSdk = 35
    ndkVersion = "27.0.12077973" // Updated

    defaultConfig {
        applicationId = "com.example.chatiar_app"
        minSdk = 24
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles("proguard-android-optimize.txt", "proguard-rules.pro")
            // ndkVersion = "27.0.12077973"
            signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")

        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17 // Updated
        targetCompatibility = JavaVersion.VERSION_17 // Updated
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString() // Updated
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.9.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation("androidx.activity:activity-ktx:1.8.0")
    implementation("com.google.firebase:firebase-auth-ktx:22.0.0")
    implementation("com.google.android.gms:play-services-auth:20.7.0")

}
apply { from("flavors.gradle.kts") }
