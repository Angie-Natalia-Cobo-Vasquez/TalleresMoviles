plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // ✅ Activa Firebase Google Services
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.talleresmoviles"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.talleresmoviles"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        // Versionado semántico
        versionCode = 1000001
        versionName = "1.0.0"
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

// ========== DEPENDENCIAS DE FIREBASE ==========
dependencies {
    // Firebase BoM (Bill of Materials)
   implementation(platform("com.google.firebase:firebase-bom:34.4.0"))

    // Firebase Core + Analytics (recomendadas por defecto)
    implementation("com.google.firebase:firebase-analytics")
}
