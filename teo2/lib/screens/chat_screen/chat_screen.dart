import 'package:flutter/material.dart';
import 'package:teo2/screens/widgets/chat/her_message_bubble.dart';
import 'package:teo2/screens/widgets/chat/my_message_bubble.dart';
import 'package:teo2/screens/widgets/shared/message_field_box.dart';

class ChatScreen extends  StatelessWidget{

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mi amor'),
        leading:
          CircleAvatar(
            backgroundImage: AssetImage("assets/marge.jpeg")
          ),
      ),
      body: ChatView()
      );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return index % 2 == 0 ? HerMessageBubble() : MyMessageBubble();
                  },)
            ),
            MessageFieldBox()
          ],
        ),
      ),
    );
  }
}