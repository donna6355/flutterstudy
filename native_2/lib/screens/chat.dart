import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, idx) => Container(
          child: Text('works'),
          padding: EdgeInsets.all(8),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/GMT3iTRHX1R2awLkWmgy/messages')
              .snapshots()
              .listen((data) {
                data.docs.forEach((document) => print(document['text']));
            // print(data.docs);
          });
        },
      ),
    );
  }
}
