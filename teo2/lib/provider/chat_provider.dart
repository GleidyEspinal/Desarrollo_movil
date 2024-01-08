
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:teo2/entities/message.dart';
import 'package:teo2/helpers/request.dart';

class ChatProvider extends ChangeNotifier {

  final scrollController = ScrollController();
  final request = Request();

  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Hola", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if(text.isEmpty)
      return;
    final message = Message(text: text, fromWho: FromWho.me);


    messageList.add(message);

    if(text.endsWith("?")){
      getYourAnswer();
    }

    notifyListeners();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      moveScrollToBottom();
    });
  }

  void moveScrollToBottom(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut
    );

  }

  Future<void> getYourAnswer() async {
    final yourAnswer = await request.getAnswer();
    messageList.add(yourAnswer);
    notifyListeners();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      moveScrollToBottom();
    });
  }

}