import 'package:flutter/material.dart';

class ChatInputBox extends StatefulWidget {
  const ChatInputBox(
      {Key? key, required this.scrollToBottom, required this.controller})
      : super(key: key);

  final scrollToBottom;
  final controller;

  @override
  _ChatInputBoxState createState() => _ChatInputBoxState();
}

class _ChatInputBoxState extends State<ChatInputBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.insert_emoticon)),
          Expanded(
            child: TextField(
              controller: widget.controller,
              enableInteractiveSelection: true,
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Type a message',
                contentPadding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: TextStyle(fontSize: 18),
              onTap: () {
                widget.scrollToBottom();
              },
            ),
          ),
          Transform.rotate(
            angle: 5.49779,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.photo_camera_rounded)),
        ],
      ),
    );
  }
}
