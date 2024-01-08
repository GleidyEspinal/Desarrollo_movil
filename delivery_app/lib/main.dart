import 'package:delivery_app/pages/login/login_page.dart';
import 'package:delivery_app/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delivery app",
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              accentColor: Colors.redAccent
          )
      ),

      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage(),),
        GetPage(name: "/register", page: () => RegisterPage(),)
      ],
    );
  }
}
