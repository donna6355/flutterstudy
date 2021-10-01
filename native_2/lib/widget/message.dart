import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'time',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatData = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemBuilder: (context, idx) => Text(chatData[idx]['text']),
          itemCount: chatData.length,
        );
      },
    );
  }
}
