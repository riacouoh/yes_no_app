import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la id atómica msj (importar message from domain/entities/)
  
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                Text(message.text, style: TextStyle(color: Colors.white, fontSize: 16),),
                Text(message.date, style: TextStyle(color: Colors.pink[100], fontSize: 14),)
              ],
            ),
          ),
        ),
        SizedBox(height: 5)
      ],
    );
  }
}