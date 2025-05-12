import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  //controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [

    Message(text: "Hola :]", fromWho: FromWho.me),
    Message(text: "Holiiiii <3 Hiiiii", fromWho: FromWho.notMe),
    Message (text: "How's it goin'?", fromWho: FromWho.me),
    Message (text: "U okay?", fromWho: FromWho.me),
    Message (text: "How's it goin'?", fromWho: FromWho.notMe)

  ];

  Future <void> sendMessage (String text) async {

    if (text.trim().isEmpty) return;

    final newMessage = Message (text : text.trim(), fromWho: FromWho.me);

    //agregar un nuevo msg a la list
    messageList.add(newMessage);

    int l = messageList.length;

    //notify of change:
    notifyListeners();
    moveScrollToBottom();
    print("Cantidad mensajes: $l");

  }

  //scrolls all the way down 
  Future <void> moveScrollToBottom () async {
    //animación
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      //offset,
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300), 
      //rebote al final de la animación
      curve: Curves.easeOut);
  }

}