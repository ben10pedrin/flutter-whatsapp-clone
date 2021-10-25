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

  FirebaseFirestore db = FirebaseFirestore.instance;

  void getUsers() async {
    String? username = context.read<MyModel>().username;
    late List<User> newUsers = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
        .collection("rooms")
        .where("roomUsers", arrayContains: username)
        .get();
    for (final doc in querySnapshot.docs) {
      Map<String, dynamic> document = doc.data();
      Map<String, dynamic> lastMessage =
          await document["lastMessage"].get().then((doc) => doc.data());
      String? newUsername = document["roomUsers"][0] == username
          ? document["roomUsers"][1]
          : document["roomUsers"][0];
      String newContent = lastMessage["content"];
      DateTime newDate = lastMessage["date"].toDate();
      User newUser = new User(newUsername, newContent, newDate);
      newUsers.add(newUser);
    }
    setState(() {
      users = newUsers;
    });
  }

  @override
  void initState() {
    getUsers();
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
