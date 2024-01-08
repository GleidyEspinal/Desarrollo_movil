import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teo2/entities/message.dart';
import 'package:teo2/provider/chat_provider.dart';
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

    //Crear un objeto de tipo provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: chatProvider.messageList.length,
                  controller: chatProvider.scrollController,
                  itemBuilder: (context, index) {
                    final messsage = chatProvider.messageList[index];
                    return messsage.fromWho == FromWho.me? MyMessageBubble(messsage: messsage,): HerMessageBubble(message: messsage,);
                  },)
            ),
            MessageFieldBox(onvalue: (String value) {
              chatProvider.sendMessage(value);
              chatProvider.moveScrollToBottom();
            },)
          ],
        ),
      ),
    );
  }
}