import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBurder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBurder,
        focusedBorder: outlineInputBurder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print("button: $textValue");
            textController.clear();
          },
        ),
      );


    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,

      onFieldSubmitted: (value) {
        print("Submit Value $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}