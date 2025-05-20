// android/build.gradle.kts

buildscript {
    dependencies {
        // Plugin de Google para Firebase, etc.
        classpath("com.android.tools.build:gradle:8.2.2")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.10")
        classpath("com.google.gms:google-services:4.4.0") // Para Firebase
    }

    repositories {
        google()
        mavenCentral()
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

distributionUrl=https://services.gradle.org/distributions/gradle-8.11.1-all.zip

