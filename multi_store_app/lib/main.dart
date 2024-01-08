import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/views/buyers/main_screen.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAhd0otmGBn1Gj2pIhoOboDsdbMooFaSLw",
        appId: "1:509543250153:android:69f9364a28cf28f8a59878",
        messagingSenderId: "509543250153",
        projectId: "multi-store-app-32142",
        storageBucket: "gs://multi-store-app-32142.appspot.com"
  ) ): Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Brand-Bold"
      ),
      title: 'Material App',
      home: MainScren()
    );
  }
}
