import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

                buildTextButton("Excuse-Me-Boss-You-Have-A-Text-Message.mp3", Colors.red, "1"),
              buildTextButton("Harry-Potter.mp3", Colors.orange, "2"),
              buildTextButton("Mision-Imposible.mp3", Colors.yellow, "3"),
              buildTextButton("Notificación-Iphone.mp3", Colors.green, "4"),
              buildTextButton("Peaky-Blinders.mp3", Colors.blue, "5"),
              buildTextButton("Piratas-Del-Caribe.mp3", Colors.indigo, "6"),
              buildTextButton("Señorita.mp3", Colors.purple, "7")

            ],
          )
        ),
      ),
    );
  }

  Expanded buildTextButton(String audio, Color color, String texto) {
    return Expanded(
      child: TextButton(
                  onPressed: (){
                    final player = AudioPlayer();
                    player.play(AssetSource(audio));
                    },
                  child: Text(texto),
                  style: TextButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
      ),
      ),
    );
  }
}
