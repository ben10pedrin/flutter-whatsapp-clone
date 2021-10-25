import 'package:flutter/material.dart';
import 'package:whatsapp/ChatView.dart';
import 'package:intl/intl.dart';

class ChatListItem extends StatefulWidget {
  const ChatListItem(
      {Key? key,
      required String this.username,
      String? this.content,
      DateTime? this.date})
      : super(key: key);

  final username;
  final content;
  final date;

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    late String dateString;

    if (date.isAfter(today)) {
      dateString = DateFormat('h:mm a').format(date);
    } else if (date.isBefore(today) && date.isAfter(yesterday)) {
      dateString = "Yesterday";
    } else {
      dateString = DateFormat('MM/dd/yy').format(date);
    }

    return dateString;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(widget.username[0]),
      ),
      title: Text(
        widget.username,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: widget.content != null ? Text(widget.content) : null,
      trailing: widget.date != null
          ? Text(
              formatDate(widget.date),
              style: TextStyle(
                  color: Theme.of(context).disabledColor, fontSize: 14),
            )
          : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatView(
                    username: widget.username,
                  )),
        );
      },
    );
  }
}
