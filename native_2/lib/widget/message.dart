import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './msg_bubble.dart';

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
          itemBuilder: (context, idx) => MsgBubble(
            chatData[idx]['text'],
            chatData[idx]['userName'],
            chatData[idx]['userId'] == FirebaseAuth.instance.currentUser!.uid,
            ValueKey(chatData[idx].id),
          ),
          itemCount: chatData.length,
        );
      },
    );
  }
}
