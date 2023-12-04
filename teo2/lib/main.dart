import 'package:flutter/material.dart';
import 'package:teo2/config/theme.dart';
import 'package:teo2/screens/chat_screen/chat_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
      title: 'Mi amor',
      home: const ChatScreen()
    );
  }
}
