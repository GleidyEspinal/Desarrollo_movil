import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teo2/config/theme.dart';
import 'package:teo2/provider/chat_provider.dart';
import 'package:teo2/screens/chat_screen/chat_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        title: 'Mi amor',
        home: const ChatScreen()
      ),
    );
  }
}
