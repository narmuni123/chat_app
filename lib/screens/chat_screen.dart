import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("chats/NutjHjwVS1N05L03eT4u/messages")
              .snapshots()
              .listen((data) {
            for (var element in data.docs) {
              if (kDebugMode) {
                print(element['text']);
              }
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: const Text("This works"),
          );
        },
      ),
    );
  }
}
