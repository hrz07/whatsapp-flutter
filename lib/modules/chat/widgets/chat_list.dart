import 'package:flutter/material.dart';
import 'package:whatsapp/modules/chat/dummy-data/dummy_chat_list.dart';
import 'package:whatsapp/modules/inbox/pages/chat_inbox_screen.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final chatList = dummy_chat_List;

    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(chat['name']!),
          subtitle: Text(chat['message']!),
          trailing: Text(chat['time']!, style: const TextStyle(fontSize: 12)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatInboxScreen(name: chat['name']!),
              ),
            );
          },
        );
      },
    );
  }
}
