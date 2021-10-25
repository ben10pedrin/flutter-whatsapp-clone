import 'package:flutter/material.dart';
import 'package:whatsapp/ChatListItem.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  _ContactsViewState createState() => _ContactsViewState();
}

class User {
  User(this.username, this.content, this.date);

  final username;
  final content;
  final date;
}

class _ContactsViewState extends State<ContactsView> {
  final users = [
    new User("Juan", "hola amigo", DateTime.now()),
    new User("Rocha", "ke tal", DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Select Contact"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ChatListItem(
              username: users[index].username,
            );
          }),
    );
  }
}
