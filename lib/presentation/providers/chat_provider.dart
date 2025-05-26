import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  //controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];
  
  DateTime nowt = DateTime.now();

  Future <void> sendMessage (String text) async {

    String formattedTime = DateFormat.Hms().format(nowt);

    if (text.trim().isEmpty) return;

    final newMessage = Message (text : text.trim(), fromWho: FromWho.me, date: formattedTime);

    //agregar un nuevo msg a la list
    messageList.add(newMessage);


    //DETECTAR si el usuario hizo una pregunta
    if (text.endsWith("?")) {
      herReply();
    }

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

  //crear respiuesta de ella
  Future<void> herReply () async {
    //obtener respuesta
    final herMessage = await getYesNoAnswer.getAnswer();

    //añadimos mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

}