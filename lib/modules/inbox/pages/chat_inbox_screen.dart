import 'package:flutter/material.dart';

class ChatInboxScreen extends StatelessWidget {
  final String name;

  const ChatInboxScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {'text': 'Yes I\'m on the train now', 'time': '14:21', 'isMe': false},
      {'text': 'I\'m here', 'time': '14:22', 'isMe': false},
      {'text': 'Can you come and get me', 'time': '14:22', 'isMe': false},
      {'text': 'are you ok?', 'time': '14:21', 'isMe': true},
      {'text': 'You were probably late', 'time': '14:23', 'isMe': true},
      {'text': 'Just outside the office', 'time': '14:24', 'isMe': true},
      {'text': 'I\'m so hungry', 'time': '14:26', 'isMe': false},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 253, 252),
        title: Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 8),
            Text(name),
          ],
        ),
        actions: const [
          Icon(Icons.videocam),
          SizedBox(width: 16),
          Icon(Icons.call),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 239, 240, 239),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("Today", style: TextStyle(color: Colors.grey)),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isMe = msg['isMe'] as bool;
                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.green[100] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            msg['text'] as String,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            msg['time'] as String,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 1),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.grey[100],
      child: Row(
        children: [
          const Icon(Icons.emoji_emotions_outlined),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.attach_file),
          const SizedBox(width: 8),
          const Icon(Icons.camera_alt),
          const SizedBox(width: 8),
          const CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.mic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
