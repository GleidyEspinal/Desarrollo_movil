import 'package:flutter/material.dart';
import 'package:social_food/social_food_theme.dart';
import "Home.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: SocialFoodTheme.darkTheme(),
      home: Home(),
    );
  }
}

