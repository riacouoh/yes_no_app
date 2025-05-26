import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                Text(message.text, style: TextStyle(color: Colors.white, fontSize: 16),),
                Text(message.date, style: TextStyle(color: Colors.purple[100], fontSize: 14),)
              ],
            ),
          ),
        ),
        SizedBox(height: 5),

        //Image:
        //signo ! garantiza siempre devolver una imagen
        _ImageBubble(imageUrl:message.imageUrl!),

        SizedBox(height: 5)
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {

  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text("Margo está enviando una imagen"),
        );
      },));
  }
}