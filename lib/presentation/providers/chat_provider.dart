import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [

    Message(text: "Hola :]", fromWho: FromWho.me),
    Message(text: "Holiiiii <3 Hiiiii", fromWho: FromWho.notMe),
    Message (text: "How's it goin'?", fromWho: FromWho.me),
    Message (text: "U okay?", fromWho: FromWho.me),
    Message (text: "How's it goin'?", fromWho: FromWho.notMe)

  ];

  Future <void> sendMessage (String text) async {
    final newMessage = Message (text : text, fromWho: FromWho.me);
    
    //agregar un nuevo msg a la list
    messageList.add(newMessage);

    //notify of change:
    notifyListeners();
  }

}