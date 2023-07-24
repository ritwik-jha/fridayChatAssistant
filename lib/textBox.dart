import 'package:flutter/material.dart';
import 'package:friday/pallete.dart';

class TextBox extends StatelessWidget {
  late Map message;
  TextBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: message['role'] == 'user'
          ? EdgeInsets.only(
              left: Pallete.getWidth(context) * 0.4,
              right: 10,
              top: 5,
              bottom: 5)
          : EdgeInsets.only(
              right: Uri.parse(message['content']).isAbsolute
                  ? 10
                  : Pallete.getWidth(context) * 0.4,
              left: 10,
              top: 5,
              bottom: 5),
      // width: Pallete.getWidth(context) * 0.1,
      decoration: BoxDecoration(
        color: message['role'] == 'user'
            ? Pallete.firstSuggestionBoxColor
            : Pallete.appbarColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Uri.parse(message['content']).isAbsolute
          ? Image(
              image: NetworkImage(message['content']),
              fit: BoxFit.contain,
            )
          : Text(
              message['content'],
              style: const TextStyle(
                color: Pallete.convoColor,
                fontFamily: 'PT Sans',
                fontSize: 16,
              ),
            ),
    );
  }
}
