import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),
        ),
        title: Text("Margo"),
        centerTitle: false,
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      //le pide que esté pendiente de cambios
      final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              
              //enlaza el controlador creado en ChatProvider
              controller: chatProvider.chatScrollController,

              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {

                //instancia que sabrá whose is the message
                final message = chatProvider.messageList[index];

                //residuo = 0 means it's hers
                //return (index % 2 == 0)

                return (message.fromWho == FromWho.notMe)
                ? const HerMessageBubble()
                : MyMessageBubble(message: message);

              },)
            ),
          
          // caja de texto
        MessageFieldBox(
          onValue: chatProvider.sendMessage),
          
          ],
          
        ),
      ),
    );
  }
}