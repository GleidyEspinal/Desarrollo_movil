import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';

import 'package:multi_store_web_app/views/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid? FirebaseOptions(
          apiKey: "AIzaSyBNRzSH_vEQTZHXadjw3rW6ouPug24vOF0",
          projectId: "multi-store-app-32142",
          storageBucket: "multi-store-app-32142.appspot.com",
          messagingSenderId: "509543250153",
          appId: "1:509543250153:web:c4dfb1c97f2c6469a59878"
      ): null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Brand-Bold"
        ),
        title: 'Material App',
        home: MainScreen(),
    );
  }
}