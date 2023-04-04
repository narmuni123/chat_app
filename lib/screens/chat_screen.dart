import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat App"),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: SizedBox(
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (item) {
                if (item == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection("chats/NutjHjwVS1N05L03eT4u/messages")
                .add({
              'text': 'This was added by clicking the button',
            });
          },
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
            final documents = streamSnapshot.data.docs;
            return ListView.builder(
              itemCount: documents.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(documents[index]['text']),
                );
              },
            );
          },
        ));
  }
}
