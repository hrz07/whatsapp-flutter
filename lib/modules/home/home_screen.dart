import 'package:flutter/material.dart';
import 'package:whatsapp/modules/chat/widgets/chat_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('Search pressed');
              },
              icon: const Icon(Icons.search, color: Colors.white),
              padding: const EdgeInsets.only(right: 20),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatsTab(),
            Center(child: Text('Status Screen')),
            Center(child: Text('Calls Screen')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB pressed');
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
