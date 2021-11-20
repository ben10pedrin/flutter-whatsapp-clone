import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ChatBubble.dart';
import 'package:whatsapp/ChatInputBox.dart';
import 'package:provider/provider.dart';
import 'MyModel.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required String this.username}) : super(key: key);

  final username;

  @override
  _ChatViewState createState() => _ChatViewState();
}

class Message {
  Message(this.from, this.content, this.date);

  final from;
  final content;
  final date;
}

class _ChatViewState extends State<ChatView> {
  late List<Message> messages = [
    new Message("Jorge", "how are you pedro?", new DateTime.now()),
    new Message("Pedro", "hi Jorge I'm good", new DateTime.now()),
    new Message("Pedro", "and you?", new DateTime.now()),
    new Message("Jorge", "i'm good too", new DateTime.now()),
    new Message("Jorge", "how did you create this app?", new DateTime.now()),
    new Message("Pedro", "I'm using flutter!", new DateTime.now()),
    new Message("Jorge", "wow", new DateTime.now()),
    new Message("Jorge", "cool", new DateTime.now()),
    new Message("Pedro", "see you later!", new DateTime.now()),
    new Message("Pedro", "see you", new DateTime.now()),
  ];
  final _scrollController = new ScrollController();
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Row(children: [
          Container(
            child: CircleAvatar(
              child: Text(widget.username[0]),
              radius: 18,
            ),
            margin: EdgeInsets.only(right: 10),
          ),
          Text(widget.username)
        ]),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://res.cloudinary.com/practicaldev/image/fetch/s--WAKqnINn--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/tw0nawnvo0zpgm5nx4fp.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Expanded(
                child: messages.length != 0
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ChatBubble(
                              content: messages[index].content,
                              hasMarginTop: index == 0
                                  ? true
                                  : messages[index].from !=
                                      messages[index - 1].from,
                              isFromUser: messages[index].from == "Pedro");
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ChatInputBox(
                      scrollToBottom: () {
                        Timer(Duration(milliseconds: 300), () {
                          _scrollController.jumpTo(
                            _scrollController.position.maxScrollExtent,
                          );
                        });
                      },
                      controller: controller,
                    )),
                    Container(
                      width: 45,
                      height: 45,
                      margin: EdgeInsets.only(right: 6),
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            controller.clear();
                          },
                          child: Icon(Icons.send),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
