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
    new User("Pedro", "hello my friend", new DateTime.now()),
    new User("Jorge", "how are you?", new DateTime.now()),
    new User("Alex", "hi pedro", new DateTime.now()),
    new User("Silvia", "yesterday was fun", new DateTime.now()),
    new User("Steve", "hello!", new DateTime.now()),
    new User("Bill", "are you good?", new DateTime.now())
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
