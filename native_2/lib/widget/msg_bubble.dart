import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MsgBubble extends StatelessWidget {
  final String msg;
  final String userName;
  final bool fromMe;
  final Key key;
  MsgBubble(
    this.msg,
    this.userName,
    this.fromMe,
    this.key,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: fromMe ? Colors.black12 : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              bottomLeft: fromMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight: fromMe ? Radius.circular(0) : Radius.circular(12),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment:
                fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!fromMe)
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userName)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }
                    return Text(
                      snapshot.data!['username'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              Text(
                msg,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
