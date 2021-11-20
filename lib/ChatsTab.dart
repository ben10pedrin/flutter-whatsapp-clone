import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ChatListItem.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/MyModel.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class User {
  User(this.username, this.content, this.date);

  final username;
  final content;
  final date;
}

class _ChatsTabState extends State<ChatsTab> {
  late List<User> users = [];

  @override
  void initState() {
    users.add(new User("Pedro", "hello my friend", new DateTime.now()));
    users.add(new User("Jorge", "how are you?", new DateTime.now()));
    users.add(new User("Alex", "hi pedro", new DateTime.now()));
    users.add(new User("Silvia", "yesterday was fun", new DateTime.now()));
    users.add(new User("Steve", "hello!", new DateTime.now()));
    users.add(new User("Bill", "are you good?", new DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return users.length != 0
        ? ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatListItem(
                username: users[index].username,
                content: users[index].content,
                date: users[index].date,
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
