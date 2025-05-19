plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.android.application"
    compileSdk = 34 // ou flutter.compileSdkVersion si tu préfères
    ndkVersion = "29.0.13113456"

    defaultConfig {
        applicationId = "com.android.application"
        minSdk = 21 // ou flutter.minSdkVersion
        targetSdk = 34 // ou flutter.targetSdkVersion
        versionCode = 1 // ou flutter.versionCode
        versionName = "1.0" // ou flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// Important : appliquer le plugin google-services ici, à la fin
apply(plugin = "com.google.gms.google-services")

tasks.withType<JavaCompile> {
    options.compilerArgs.add("-Xlint:-options")
}

