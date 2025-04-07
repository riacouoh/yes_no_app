import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [

    Message(text: "Hola :]", fromWho: FromWho.me),
    Message(text: "Holiiiii <3", fromWho: FromWho.notMe)

  ];

}