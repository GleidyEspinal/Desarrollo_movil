import 'package:dio/dio.dart';
import 'package:teo2/entities/message.dart';
import 'package:teo2/models/request_model.dart';

//final requestModel = RequestModel(answer: answer, forced: forced, image: image)

class Request {
  final dio = Dio();

  Future<Message> getAnswer() async{
    final response = await dio.get("https://yesno.wtf/api");

    final message = RequestModel.fromJson(
      response.data
    );

    //return  Message(text: message.answer, fromWho: FromWho.yours, imageURL: message.image);
    return message.convertToMessage();
  }
}