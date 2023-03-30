import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats/NutjHjwVS1N05L03eT4u/messages")
              .snapshots(),
          builder: (ctx, AsyncSnapshot<dynamic> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: streamSnapshot.data.docs.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("This works"),
                );
              },
            );
          },
        ));
  }
}
