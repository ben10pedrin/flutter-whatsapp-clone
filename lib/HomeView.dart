import 'package:flutter/material.dart';
import 'package:whatsapp/ChatsTab.dart';
import 'package:whatsapp/ContactsView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text('WhatsApp'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.photo_camera_rounded),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text("cam"),
            ChatsTab(),
            Text("stat"),
            Text("call"),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsView()),
              );
            },
            child: Icon(Icons.chat_rounded),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
