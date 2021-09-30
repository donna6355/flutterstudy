import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        //need to explicit the type of <QuerySnapshot>, otherwise it will consider it as Object!
        stream: FirebaseFirestore.instance
            .collection('chats/GMT3iTRHX1R2awLkWmgy/messages')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemBuilder: (context, idx) {
              return Container(
                child: Text(docs[idx]['text']),
                padding: EdgeInsets.all(8),
              );
            },
            itemCount: docs.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/GMT3iTRHX1R2awLkWmgy/messages')
              .add({'text': 'this is added by floating button'}); 
        },
      ),
    );
  }
}
