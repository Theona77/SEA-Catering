import 'dart:ui';

import 'package:sea_catering/data/repositories.authentication/authentication_repository.dart';
import 'package:sea_catering/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void>main() async {

  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Get Local storage
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding:widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );


  await Supabase.initialize(
    url: 'https://qzujmlvhdupzbltmgjyp.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6dWptbHZoZHVwemJsdG1nanlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA4NzIzNzAsImV4cCI6MjA2NjQ0ODM3MH0.flzzVTSAU4Xjs6sTovVgef-NXlGGAJbIa7p5C569LrU',
  );

  WidgetsFlutterBinding.ensureInitialized();

  // Catch all Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Optional: Log it or send to crashlytics
  };

  // Catch all Dart async errors
  PlatformDispatcher.instance.onError = (error, stack) {
    // Optional: Log error
    return true; // prevents red screen
  };


  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Something went wrong',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  };


  runApp(const MyApp());

}


