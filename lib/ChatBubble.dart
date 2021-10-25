import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble(
      {Key? key,
      required String this.content,
      required bool this.hasMarginTop,
      required bool this.isFromUser})
      : super(key: key);

  final content;
  final hasMarginTop;
  final isFromUser;

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    return Row(
      mainAxisAlignment:
          widget.isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.only(
                  left: !widget.isFromUser ? 7 : 0,
                  right: widget.isFromUser ? 7 : 0,
                  top: widget.hasMarginTop ? 8 : 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget.isFromUser
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text(
                widget.content,
                style: TextStyle(
                  color: widget.isFromUser
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).shadowColor,
                  fontSize: 16,
                ),
              )),
        ),
      ],
    );
  }
}
